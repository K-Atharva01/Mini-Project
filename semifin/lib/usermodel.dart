class usermodel {
  String? fname;
  String? fage;
  String? femail;
  String? fcontact;
  String? fbio;
  String? fimage;
  String? fpass;

  usermodel(
      {this.fname,
      this.fage,
      this.fbio,
      this.fcontact,
      this.femail,
      this.fimage,
      this.fpass});

  usermodel.fromJson(Map<String, dynamic> json) {
    fname = json['name'];
    fage = json['age'];
    femail = json['email'];
    fcontact = json['contact'];
    fbio = json['bio'];
    fimage = json['image'];
    fpass = json['password'];
  }
}

class adminmodel {
  String? amainname;
  String? aname1;
  String? aname2;
  String? aname3;
  String? add1;
  String? add2;
  String? aemail;
  String? acontact1;
  String? acontact2;
  String? acontact3;
  String? aact;
  String? aimage;
  String? adate;

  adminmodel(
      {this.aname1,
      this.aname2,
      this.aname3,
      this.amainname,
      this.aemail,
      this.acontact1,
      this.acontact3,
      this.acontact2,
      this.aact,
      this.adate,
      this.aimage,
      this.add1,
      this.add2});

  adminmodel.fromJson(Map<String, dynamic> json) {
    aname1 = json['nameofhead1'];
    aname2 = json['nameofhead2'];
    aname3 = json['nameofhead3'];
    amainname = json['name'];
    aemail = json['email'];
    acontact1 = json['contactnumber1'];
    acontact2 = json['contactnumber2'];
    acontact3 = json['contactnumber3'];
    add1 = json['address1'];
    add2 = json['address2'];
    aact = json['activities'];
    aimage = json['image'];
    adate = json['startdate'];
  }
}
