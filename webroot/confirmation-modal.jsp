<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>

<button type="button" class="display-none" id="open_common_modal" data-toggle="modal" data-target="#common_modal">click</button>
<div class="modal fade modal-backgrounddrop" id="common_modal" role="dialog">
	<div class="modal-dialog m">
		<div class="modal-content">
			<div class="modal-header" style="padding-top:60px; padding-bottom: 40px;">				
				<h4 class="modal-title" id="common_modal_title"></h4>
				<button type="button" class="close cross-outline" data-dismiss="modal" aria-hidden="true" style="font-size: 38px;">&times;</button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-12 xol-sm-12 col-xs-12">
						<p class="font-18 font-w-500 text-center line-h-27 color-black" id="common_content"></p>
					</div>
				</div>
			</div>
			<div class="modal-footer p-b-70" style="padding-bottom: 70px;">
				<div class="row" id="common_footer_btn">
					
				</div>
			</div>
		</div>
	</div>
</div>