//检查电影的名字
function checkFilmName(){
	var fname = document.getElementById("fname");
	var fnameEmp = document.getElementById("fnameEmp");
	if(fname.value==""){
		fnameEmp.className = "error_prompt";
		fnameEmp.innerHTML = "电影名不能为空！";
		return false;
	}
	fnameEmp.className = "ok_prompt";
	fnameEmp.innerHTML = "电影名输入成功。";
	return true;
}

//检查电影的作者
function checkFilmAuthor(){
	var fauthor = document.getElementById("fauthor");
	var fauthorEmp = document.getElementById("fauthorEmp");
	if(fauthor.value==""){
		fauthorEmp.className = "error_prompt";
		fauthorEmp.innerHTML = "导演名不能为空！";
		return false;
	}
	fauthorEmp.className = "ok_prompt";
	fauthorEmp.innerHTML = "导演名输入成功。";
	return true;
	
}

//检查电影的主要演员
function checkFilmActor(){
	var factor = document.getElementById("factor");
	var factorEmp = document.getElementById("factorEmp");
	if(factor.value==""){
		factorEmp.className = "error_prompt";
		factorEmp.innerHTML = "演员名不能为空！";
		return false;
	}
	factorEmp.className = "ok_prompt";
	factorEmp.innerHTML = "演员名输入成功。";
	return true;
	
}

//检查电影发行日期
function checkRunDate(){
	var frundate = document.getElementById("frundate");
	var frundateEmp = document.getElementById("frundateEmp");
	if(frundate.value==""){
		frundateEmp.className = "error_prompt";
		frundateEmp.innerHTML = "上映日期不能为空！";
		return false;
	}
	frundateEmp.className = "ok_prompt";
	frundateEmp.innerHTML = "上映日期输入成功。";
	return true;
	
}

//检查电影简介
function checkFilmIntrodution(){
	var fintrodution = document.getElementById("fintrodution");
	var fintrodutionEmp = document.getElementById("fintrodutionEmp");
	if(fintrodution.value==""){
		fintrodutionEmp.className = "error_prompt";
		fintrodutionEmp.innerHTML = "简介不能为空！";
		return false;
	}
	fintrodutionEmp.className = "ok_prompt";
	fintrodutionEmp.innerHTML = "简介输入成功。";
	return true;
	
}

//检查电影海报
function checkFile(){
	var fpic = document.getElementById("fpic");
	var fileErr = document.getElementById("fileErr");
	var fpic_id = fpic.value;
	if(fpic_id==""){
		fileErr.className = "error_prompt";
		fileErr.innerHTML = "图片不能为空！";
		return false;
	}else{
//		var fileErr = document.getElementById("fileErr");
		var index = fpic_id.indexOf(".");
		fpic_id = fpic_id.substring(index);
		if(fpic_id!=".bmp"&&fpic_id!=".jpg"&&fpic_id!=".jpeg"&&fpic_id!=".png"&&fpic_id!=".gif"&&fpic_id!=".PNG"){
			fileErr.className = "error_prompt";
			fileErr.innerHTML = "图片格式错误！";
			document.getElementById('fpic').value="";
			return false;
		}
		else{
			fileErr.className="ok_prompt";
			fileErr.innerHTML="图片输入正确"
			return true;
		}
	}
}

//提交表单时检查有没有没填写的
function checkForm(){
	var flagFilmName=checkFilmName();
	var flagFilmAuthor=checkFilmAuthor();
	var flagFilmActor=checkFilmActor();
	var flagRunDate=checkRunDate();
	var flagFilmIntrodution=checkFilmIntrodution();
	var flagFile=checkFile();
	
	checkFilmName();
	checkFilmAuthor();
	checkFilmActor();
	checkRunDate();
	checkFilmIntrodution();
	checkFile();
	if(flagFilmName==true && flagFilmAuthor==true && flagFilmActor==true && flagRunDate==true && flagFilmIntrodution==true && flagFile==true){
		return true;
	}
	else{
		return false;
	}
}



//检查音乐的名字
function checkMusicName(){
	var mname = document.getElementById("mname");
	var mnameEmp = document.getElementById("mnameEmp");
	if(mname.value==""){
		mnameEmp.className = "error_prompt";
		mnameEmp.innerHTML = "音乐名不能为空！";
		return false;
	}
	mnameEmp.className = "ok_prompt";
	mnameEmp.innerHTML = "音乐名输入成功。";
	return true;
}

//检查音乐的作者
function checkMusicAuthor(){
	var mauthor = document.getElementById("mauthor");
	var mauthorEmp = document.getElementById("mauthorEmp");
	if(mauthor.value==""){
		mauthorEmp.className = "error_prompt";
		mauthorEmp.innerHTML = "作者名不能为空！";
		return false;
	}
	mauthorEmp.className = "ok_prompt";
	mauthorEmp.innerHTML = "作者名输入成功。";
	return true;
}

//检查音乐的演唱者
function checkMusicSinger(){
	var msinger = document.getElementById("msinger");
	var msingerEmp = document.getElementById("msingerEmp");
	if(msinger.value==""){
		msingerEmp.className = "error_prompt";
		msingerEmp.innerHTML = "演唱者不能为空！";
		return false;
	}
	msingerEmp.className = "ok_prompt";
	msingerEmp.innerHTML = "演唱者输入成功。";
	return true;
}

//检查音乐的发行日期
function checkMusicRunDate(){
	var mrundate = document.getElementById("mrundate");
	var mrundateEmp = document.getElementById("mrundateEmp");
	if(mrundate.value==""){
		mrundateEmp.className = "error_prompt";
		mrundateEmp.innerHTML = "发行日期不能为空！";
		return false;
	}
	mrundateEmp.className = "ok_prompt";
	mrundateEmp.innerHTML = "发行日期输入成功。";
	return true;
}

//检查音乐的简介
//function checkMusicIntroduction(){
//	var mintroduction = document.getElementById("mintroduction");
//	var mintroductionEmp = document.getElementById("mintroductionEmp");
//	if(mintroduction.value==""){
//		mintroductionEmp.className = "error_prompt";
//		mintroductionEmp.innerHTML = "简介不能为空！";
//		return false;
//	}
//	mintroductionEmp.className = "ok_prompt";
//	mintroductionEmp.innerHTML = "简介输入成功。";
//	return true;
//}

//检查音乐的封面
function checkMusicPic(){
	var mpic = document.getElementById("mpic");
	var musicErr = document.getElementById("mpicErr");
	var bpic_id = mpic.value;
	if(mpic.value==""){
		musicErr.className = "error_prompt";
		musicErr.innerHTML = "封面不能为空！";
		return false;
	}else{
		var index = bpic_id.indexOf(".");
		mpic_id = mpic_id.substring(index);
		if(mpic_id!=".bmp"&&mpic_id!=".jpg"&&mpic_id!=".jpeg"&&mpic_id!=".png"&&mpic_id!=".gif"&&mpic_id!=".PNG"){
			musicErr.className = "error_prompt";
			musicErr.innerHTML = "图片格式错误！";
			document.getElementById('mpic').value="";
			return false;
		}
		else{
			musicErr.className="ok_prompt";
			musicErr.innerHTML="封面输入正确"
			return true;
		}
	}
}

//检查音乐文件的上传格式
function checkMusicFile(){
	var mfile = document.getElementById("mfile");
	var mfileErr = document.getElementById("mfileErr");
	var mfile_id = mfile.value;
	if(mfile.value==""){
		mfileErr.className = "error_prompt";
		mfileErr.innerHTML = "音乐文件不能为空！";
		return false;
	}else{
		var index = mfile_id.indexOf(".");
		mfile_id = mfile_id.substring(index);
		if(mfile_id!=".mp3"){
			mfileErr.className = "error_prompt";
			mfileErr.innerHTML = "音乐文件格式错误";
			return false;
		}
		else{
			mfileErr.className = "ok_prompt";
			mfileErr.innerHTML = "音乐文件输入正确";
			return true;
		}
	}
}

function checkMusicForm(){
	var flagMusicName=checkMusicName();
	var flagMusicAuthor=checkMusicAuthor();
	var flagMusicSinger=checkMusicSinger();
	var flagMusicRunDate=checkMusicRunDate();
	var flagMusicPic=checkMusicPic();
	var flagMusicFile=checkMusicFile();
	
	checkMusicName();
	checkMusicAuthor();
	checkMusicSinger();
	checkMusicRunDate();
	checkMusicPic();
	checkMusicFile();
	if(flagMusicName==true&&flagMusicAuthor==true&&flagMusicSinger==true&&flagMusicRunDate==true&&flagMusicPic==true&&flagMusicFile==true){
		return true;
	}else{
		return false;
	}
}


function checkBookName(){
	var bname = document.getElementById("bname");
	var bnameEmp = document.getElementById("bnameEmp");
	if(bname.value==""){
		bnameEmp.className = "error_prompt";
		bnameEmp.innerHTML = "书名不能为空！";
		return false;
	}
	bnameEmp.className = "ok_prompt";
	bnameEmp.innerHTML = "书名输入成功。";
	return true;
}

function checkBookPic(){
	var bpic = document.getElementById("bpic");
	var bpicErr = document.getElementById("bpicErr");
	var bpic_id = bpic.value;
	if(bpic.value==""){
		bpicErr.className = "error_prompt";
		bpicErr.innerHTML = "封面不能为空！";
		return false;
	}else{
		var index = bpic_id.indexOf(".");
		bpic_id = bpic_id.substring(index);
		if(bpic_id!=".bmp"&&bpic_id!=".jpg"&&bpic_id!=".jpeg"&&bpic_id!=".png"&&bpic_id!=".gif"&&bpic_id!=".PNG"){
			bpicErr.className = "error_prompt";
			bpicErr.innerHTML = "图片格式错误！";
			document.getElementById('bpic').value="";
			return false;
		}
		else{
			bpicErr.className="ok_prompt";
			bpicErr.innerHTML="封面输入正确"
			return true;
		}
	}
}

function checkBookAuthor(){
	var bauthor = document.getElementById("bauthor");
	var bauthorEmp = document.getElementById("bauthorEmp");
	if(bauthor.value==""){
		bauthorEmp.className = "error_prompt";
		bauthorEmp.innerHTML = "作者名不能为空！";
		return false;
	}
	bauthorEmp.className = "ok_prompt";
	bauthorEmp.innerHTML = "作者名输入成功。";
	return true;
}

function checkBookPublisher(){
	var bpublisher = document.getElementById("bpublisher");
	var bpublisherEmp = document.getElementById("bpublisherEmp");
	if(bpublisher.value==""){
		bpublisherEmp.className = "error_prompt";
		bpublisherEmp.innerHTML = "发行日期不能为空！";
		return false;
	}
	bpublisherEmp.className = "ok_prompt";
	bpublisherEmp.innerHTML = "发行日期输入成功。";
	return true;
}

function checkBookPublishDate(){
	var bpublishdate = document.getElementById("bpublishdate");
	var bpublishdateEmp = document.getElementById("bpublishdateEmp");
	if(bpublishdate.value==""){
		bpublishdateEmp.className = "error_prompt";
		bpublishdateEmp.innerHTML = "发行日期不能为空！";
		return false;
	}
	bpublishdateEmp.className = "ok_prompt";
	bpublishdateEmp.innerHTML = "发行日期输入成功。";
	return true;
}

function checkBookIntroduction(){
	var bintroduction = document.getElementById("bintroduction");
	var bintroductionEmp = document.getElementById("bintroductionEmp");
	if(bintroduction.value==""){
		bintroductionEmp.className = "error_prompt";
		bintroductionEmp.innerHTML = "简介不能为空！";
		return false;
	}
	bintroductionEmp.className = "ok_prompt";
	bintroductionEmp.innerHTML = "简介输入成功。";
	return true;
}

function checkBookForm(){
	var flagBookName=checkBookName();
	var flagBookAuthor=checkBookAuthor();
	var flagBookPublisher=checkBookPublisher();
	var flagBookPublishDate=checkBookPublishDate();
	var flagBookIntroduction=checkBookIntroduction();
	var flagBookPic=checkBookPic();
	
	checkBookName();
	checkBookAuthor();
	checkBookPublisher();
	checkBookPublishDate();
	checkBookIntroduction();
	checkBookPic();
	if(flagBookName==true&&flagBookAuthor==true&&flagBookPublisher==true&&flagBookPublishDate==true&&flagBookIntroduction==true&&flagBookPic==true){
		return true;
	}else{
		return false;
	}
}
