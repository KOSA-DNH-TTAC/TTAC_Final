package kr.or.kosa.aws;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.net.URLEncoder;
import java.util.Optional;
import java.util.Properties;

import org.apache.http.HttpStatus;
import org.apache.ibatis.io.Resources;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CopyObjectRequest;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import com.amazonaws.util.IOUtils;

@Configuration
public class AwsS3 {
	
    //Amazon-s3-sdk 
    private AmazonS3 s3Client;
    
    private String accessKey;
    private String secretKey;
    private Regions clientRegion = Regions.AP_NORTHEAST_2;
    private String bucket = "kosa-s3-bucket";
    
    

    private AwsS3() {
    	 String resource = "aws.properties";
         Properties properties = new Properties();
         
         try {
             Reader reader = Resources.getResourceAsReader(resource);
             properties.load(reader);
             
             accessKey = properties.getProperty("aws.accessKey");
             secretKey = properties.getProperty("aws.secretKey");
             
         } catch (IOException e) {
             e.printStackTrace();
         }
        createS3Client();
    }

    //singleton pattern
    static private AwsS3 instance = null;
    
    public static AwsS3 getInstance() {
        if (instance == null) {
            return new AwsS3();
        } else {
            return instance;
        }
    }

    //aws S3 client 생성
    private void createS3Client() {

        AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);
        this.s3Client = AmazonS3ClientBuilder
                .standard()
                .withCredentials(new AWSStaticCredentialsProvider(credentials))
                .withRegion(clientRegion)
                .build();
    }
    
    private Optional<File> convert(MultipartFile file) throws  IOException {
        File convertFile = new File(file.getOriginalFilename());
        
        if(convertFile.createNewFile()) {
            try (FileOutputStream fos = new FileOutputStream(convertFile)) {
                fos.write(file.getBytes());
            }
            return Optional.of(convertFile);
        }
        return Optional.empty();
    }
    
    public void upload(MultipartFile multipartfile, String key) throws IOException {
    	File uploadFile = convert(multipartfile)
    			.orElseThrow(() -> new IllegalArgumentException("MultipartFile -> File 전환 실패"));
        uploadToS3(new PutObjectRequest(this.bucket, key, uploadFile));
    }

    public void upload(InputStream is, String key, String contentType, long contentLength) {
        ObjectMetadata objectMetadata = new ObjectMetadata();
        objectMetadata.setContentType(contentType);
        objectMetadata.setContentLength(contentLength);

        uploadToS3(new PutObjectRequest(this.bucket, key, is, objectMetadata));
    }

    //PutObjectRequest는 Aws S3 버킷에 업로드할 객체 메타 데이터와 파일 데이터로 이루어져있다.
    private void uploadToS3(PutObjectRequest putObjectRequest) {

        try {
            this.s3Client.putObject(putObjectRequest);
            System.out.println("세상사람들 이거 꼭 보세요!!" +putObjectRequest.getBucketName());
            System.out.println(String.format("[%s] upload complete", putObjectRequest.getKey()));

        } catch (AmazonServiceException e) {
            e.printStackTrace();
        } catch (SdkClientException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void copy(String orgKey, String copyKey) {
        try {
            //Copy 객체 생성
            CopyObjectRequest copyObjRequest = new CopyObjectRequest(
                    this.bucket,
                    orgKey,
                    this.bucket,
                    copyKey
            );
            //Copy
            this.s3Client.copyObject(copyObjRequest);

            System.out.println(String.format("Finish copying [%s] to [%s]", orgKey, copyKey));

        } catch (AmazonServiceException e) {
            e.printStackTrace();
        } catch (SdkClientException e) {
            e.printStackTrace();
        }
    }

    public void delete(String key) {
        try {
            //Delete 객체 생성
            DeleteObjectRequest deleteObjectRequest = new DeleteObjectRequest(this.bucket, key);
            //Delete
            this.s3Client.deleteObject(deleteObjectRequest);
            System.out.println(String.format("[%s] deletion complete", key));

        } catch (AmazonServiceException e) {
            e.printStackTrace();
        } catch (SdkClientException e) {
            e.printStackTrace();
        }
    }
    
    public String searchIcon(String fileName) {
        return s3Client.getUrl(this.bucket, fileName).toString();
    }
    
    public ResponseEntity<byte[]> getObject(String storedFileName) throws IOException {
        S3Object o = s3Client.getObject(this.bucket, storedFileName);
        S3ObjectInputStream objectInputStream = o.getObjectContent();
        byte[] bytes = IOUtils.toByteArray(objectInputStream);
 
        String fileName = URLEncoder.encode(storedFileName, "UTF-8").replaceAll("\\+", "%20");
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        httpHeaders.setContentLength(bytes.length);
        httpHeaders.setContentDispositionFormData("attachment", fileName);
 
        return new ResponseEntity<>(bytes, httpHeaders, HttpStatus.SC_OK);
 
    }
    
}