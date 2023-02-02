<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- ======= Blog Section ======= -->
<section id="blog" class="blog">
	<div class="container" data-aos="fade-up">

		<div class="row">

			<div class="col-lg-8 entries">

				<article class="entry">

					<h2 class="entry-title">
						<a href="blog-single.html">${freeBoard.title}</a>
					</h2>

					<div class="entry-meta">
						<ul>
							<li class="d-flex align-items-center"><i class="bi bi-person"></i><a href="blog-single.html">${freeBoard.memberId}</a></li>
							<li class="d-flex align-items-center"><i class="bi bi-clock"></i><a href="blog-single.html">${freeBoard.writeDate}</a></li>
							<li class="d-flex align-items-center"><i class="bi bi-chat-dots"></i> <a href="blog-single.html">아이고!!!!!!!!!!</a></li>
							<!-- reply.comment 댓글 개수 -->
							<li class="d-flex align-items-center"><i class="bi bi-chat-dots" />${freeBoard.likeNum}</li>
						</ul>
					</div>

					<div class="entry-content">
						<p>${freeBoard.content}</p>
					</div>

				</article>
			</div>
		</div>
	</div>
</section>
<!-- End blog entry -->