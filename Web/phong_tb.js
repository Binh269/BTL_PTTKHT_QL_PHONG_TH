$(document).ready(function () {

    window.loadtimkiemphong = function () {
        var timkiem = $("#timkieminput").val().trim();
        var container = $(".data_phong_tb");
        container.empty();
        container.append('<div>Đang tải dữ liệu...</div>');

        $.post('API.aspx', { action: 'search', timkiem : timkiem }, function (data) {
            container.empty();
            if (data.length > 0) {
                data.forEach(function (phong) {
                    var phongDiv = $("<div class='phong'></div>");
                    phongDiv.append($("<div></div>").html(
                        `<div class="tt_phong">
                            <h3 style="text-align: center;"> Thông Tin Phòng Học </h3>
                            <h4>Mã Phòng Học: ${phong.maphong}</h4>
                            <h4>Tên Phòng Học: ${phong.tenphong}</h4>
                            <h4>Trạng Thái Phòng Học : ${statusPhong(phong.ttphong)}</h4>
                        </div>
                        <div class="change">
                            <button class="button_phong" id="add-btn" onclick="them_phong()">Thêm phòng</button>
                            <button class="button_phong" id="edit-btn" onclick="sua_phong('${phong.maphong}', this)">Sửa</button>
                            <button class="button_phong" id="delete-btn" onclick="xoa_phong('${phong.maphong}', this)">Xóa</button>
                        </div>
                    `));

                    var thietBiListDiv = $("<div class='thiet_bi_list'></div>");
                    thietBiListDiv.append('<strong style="display: flex; justify-content: space-around;">Danh Sách Thiết Bị:</strong>');
                    thietBiListDiv.append($("<div class='button-add'></div>").html(`<button class="button_tb" id="add-btn" onclick="them_tb('${phong.maphong}', this)">Thêm thiết bị</button>`));

                    if (phong.thiet_bi_list && phong.thiet_bi_list.length > 0) {
                        phong.thiet_bi_list.forEach(function (thietBi) {
                            var thietBiDiv = $("<div class='thietbi'></div>");
                            thietBiDiv.append($('<div class="tt_thietbi"></div>').text("Mã Thiết Bị: " + thietBi.matb + ", Tên: " + thietBi.tentb + ", Trạng Thái: " + status(thietBi.tttbi)));
                            thietBiDiv.append($('<div class="tb_nut"></div>').html(
                                `<button class="button_tb" id="edit-btn" onclick="sua_tb('${thietBi.matb}', this)">Sửa</button>
                                     <button class="button_tb" id="delete-btn" onclick="xoa_tb('${thietBi.matb}', this)">Xóa</button>`
                            ));
                            thietBiListDiv.append(thietBiDiv);
                        });
                    } else {
                        thietBiListDiv.append("<div>Không có thiết bị nào trong phòng này.</div>");
                    }

                    phongDiv.append(thietBiListDiv);
                    container.append(phongDiv);
                });
            } else {
                container.append('<div>Không có dữ liệu nào.</div>');
            }
            if (callback) callback();
        }, 'json');
    }
    $("#timkiemphong").on("click", function () {
        loadtimkiemphong();
    });
});