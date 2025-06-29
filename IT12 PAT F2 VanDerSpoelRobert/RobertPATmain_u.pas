unit RobertPATmain_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.Imaging.jpeg, Vcl.Buttons, Vcl.Menus, Vcl.Samples.Spin, Vcl.MPlayer,
  Vcl.AppAnalytics, Winapi.WebView2, Winapi.ActiveX, Vcl.Edge, Vcl.OleCtrls,
  SHDocVw, Vcl.ColorGrd, Vcl.BaseImageCollection, Vcl.ImageCollection,
  Vcl.WinXCalendars, Vcl.WinXCtrls, Vcl.Touch.Keyboard, Vcl.JumpList,
  Vcl.ActnMan, Vcl.ActnColorMaps, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdIMAP4,
  Vcl.DBCtrls, Vcl.CheckLst, Soap.InvokeRegistry, Soap.WSDLIntf,
  Soap.SOAPPasInv, Soap.SOAPHTTPPasInv, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, DateUtils, math, clsDistance_u, clsUsername_u,
  Vcl.FileCtrl, Xml.xmldom, Xml.XmlTransform, Vcl.TabNotBk, VCLTee.TeeDraw3D;

type
  TfrmVolitant_Express = class(TForm)
    conDB: TADOConnection;
    tblCompany: TADOTable;
    dsrCompany: TDataSource;
    qrySQL: TADOQuery;
    dsrSQL: TDataSource;
    tblItems: TADOTable;
    tblOrders: TADOTable;
    tblPlanes: TADOTable;
    dsrItems: TDataSource;
    dsrOrders: TDataSource;
    dsrPlanes: TDataSource;
    pgcMain: TPageControl;
    tsRegister: TTabSheet;
    tsLogin: TTabSheet;
    pgcRegister: TPageControl;
    tsDetails: TTabSheet;
    tsContact: TTabSheet;
    lblWelcome: TLabel;
    btnRegisterGO: TButton;
    btnLoginGO: TButton;
    tsLastInfo: TTabSheet;
    grbMoreInfo: TGroupBox;
    btnIntroVid: TButton;
    btnAboutUs: TButton;
    btnGallery: TButton;
    btnRegBack: TButton;
    btnLoginBack: TButton;
    lblRegister: TLabel;
    pnlCdetails: TPanel;
    lblCname: TLabel;
    edtCName: TEdit;
    lblCreatePassword: TLabel;
    edtCreatePassword: TEdit;
    lblConfirmPass: TLabel;
    edtConfirmPass: TEdit;
    chkGovernment: TCheckBox;
    imgRegPlane: TImage;
    imgBasedFlag: TImage;
    cmbCountryBased: TComboBox;
    BitBtnTOcInfo: TBitBtn;
    pnlRegContact: TPanel;
    lblRegEmail: TLabel;
    edtRegEmail: TEdit;
    chkNewsLetter: TCheckBox;
    tsRegConfirm: TTabSheet;
    pnlLastRegInfo: TPanel;
    dtpEstablishedDate: TDateTimePicker;
    lblEstabDate: TLabel;
    lblRegDefaultHours: TLabel;
    sedRegDefaultHours: TSpinEdit;
    imgRegEarth: TImage;
    BitBtnRegister: TBitBtn;
    redConfirmRegInfo: TRichEdit;
    lblConfirmReg: TLabel;
    btnRegRestart: TButton;
    tsIntroVideo: TTabSheet;
    tsGallery: TTabSheet;
    mpIntroVideo: TMediaPlayer;
    pnlVideo: TPanel;
    lblIntroVid: TLabel;
    lblGallery: TLabel;
    tsAdmin: TTabSheet;
    pgcAdmin: TPageControl;
    lblLogin: TLabel;
    tsItemsAdmin: TTabSheet;
    tsPlanesAdmin: TTabSheet;
    grbAdminQuick: TGroupBox;
    tsOrdersAdmin: TTabSheet;
    tsCompaniesAdmin: TTabSheet;
    btnToItems: TButton;
    btnToPlanes: TButton;
    btnToOrders: TButton;
    btnToCompanies: TButton;
    tsHome: TTabSheet;
    tsEmailsAdmin: TTabSheet;
    btnToEmails: TButton;
    lblUsernameLogin: TLabel;
    edtUsernameLogin: TEdit;
    edtPasswordLogin: TEdit;
    lblPasswordLogin: TLabel;
    btnLogin: TButton;
    tsCustomAdmin: TTabSheet;
    btnToSummary: TButton;
    grbHome: TGroupBox;
    tsPayment: TTabSheet;
    tsPOrder: TTabSheet;
    tsManageCompany: TTabSheet;
    tsLog: TTabSheet;
    btnTOorder: TButton;
    btnTOLog: TButton;
    btnTOpayment: TButton;
    btnManageCompany: TButton;
    lblGenUsername: TLabel;
    edtGUsername: TEdit;
    lblPasswordConfirm: TLabel;
    pnlConfirmPass: TPanel;
    lblConfirmAge: TLabel;
    sedCompanyAgeConfirm: TSpinEdit;
    lblConfirmOther: TLabel;
    btnPlayVid: TButton;
    btnPauseVid: TButton;
    btnRestartVid: TButton;
    BitBtnBackTOWelcomeFromVid: TBitBtn;
    imgVPLeft: TImage;
    imgVPRight: TImage;
    lblOrder: TLabel;
    lblItemsAdmin: TLabel;
    dbgSQL_admin: TDBGrid;
    edtCustomSQL: TEdit;
    lblCustomSQL: TLabel;
    btnCustomSQL: TButton;
    grbAddItem: TGroupBox;
    edtItemAddName: TEdit;
    cmbItemCategoryAdd: TComboBox;
    chkDangerousItemAdd: TCheckBox;
    redAddDescription: TRichEdit;
    lblAddItemName: TLabel;
    lblAddItemCategory: TLabel;
    btnAddCategoty: TButton;
    lblAddTransportItemPrice: TLabel;
    lblAddItemDescription: TLabel;
    btnAddItem: TButton;
    grbManageItems: TGroupBox;
    pgcOrder: TPageControl;
    tsPlaceOrder: TTabSheet;
    tsOrderSummary: TTabSheet;
    tsAdminSum: TTabSheet;
    lblAdminSum: TLabel;
    grbAddPlane: TGroupBox;
    lblManagePlanes: TLabel;
    grbManagePlanes: TGroupBox;
    ListBox1: TListBox;
    lstSelectItemManage: TListBox;
    lblSelectItemTomanage: TLabel;
    btnRetireItem: TButton;
    redUpdateItem: TRichEdit;
    btnUpdateItem: TButton;
    lblUpdateItemInfo: TLabel;
    sedAddItemRands: TSpinEdit;
    sedItemAddCents: TSpinEdit;
    lblAddRands: TLabel;
    lblAddCents: TLabel;
    lblUpdateItemPrice: TLabel;
    sedUpdateItemRands: TSpinEdit;
    sedUpdateItemCents: TSpinEdit;
    lblUpdateItemRands: TLabel;
    lblUpdateItemCents: TLabel;
    edtAddPlaneName: TEdit;
    sedAddPlaneMLoad: TSpinEdit;
    sedAddPlaneCSpeed: TSpinEdit;
    sedAddFuelRands: TSpinEdit;
    sedAddFuelCents: TSpinEdit;
    sedAddPlaneMDistance: TSpinEdit;
    btnAddPlane: TButton;
    lblAddNameOfPlane: TLabel;
    lblAddPlaneMaxLoad: TLabel;
    lblAddPlaneCruiseSpeed: TLabel;
    lblAddPlaneDistance: TLabel;
    lblPlaneAddFeulCosr: TLabel;
    lblAddFuelRand: TLabel;
    lblAddFuelCents: TLabel;
    lblUpdateFuelPrice: TLabel;
    chkRetirePlane: TCheckBox;
    sedUpdateFuelRands: TSpinEdit;
    sedUpdateFuelCents: TSpinEdit;
    lblUpdateFuelRands: TLabel;
    lblUpdateFuelCents: TLabel;
    lstManagePlane: TListBox;
    lblSelectPlaneUpdate: TLabel;
    btnUpdatePlane: TButton;
    cmbSelectTable: TComboBox;
    dbgDifferentTables: TDBGrid;
    grbSelectTable: TGroupBox;
    grbTableTotal: TGroupBox;
    pnlTotalAccounts: TPanel;
    pnlTotalOrders: TPanel;
    pnlTotalItems: TPanel;
    pnlTotalPlanes: TPanel;
    btnReloadSum: TButton;
    grbStatistics: TGroupBox;
    lblTopPlain: TLabel;
    lblTopItem: TLabel;
    lblTotalRevenue: TLabel;
    lblTopPickupC: TLabel;
    lblTopDropOffC: TLabel;
    lblAverageWeight: TLabel;
    grbProgress: TGroupBox;
    PBrevenue: TProgressBar;
    PBOrders: TProgressBar;
    lblRevenueProgress: TLabel;
    lblOrdersManagedProgress: TLabel;
    lblCustomSQLPage: TLabel;
    sbGallery: TScrollBox;
    btnToCustom: TButton;
    chkConfirmRegInfo: TCheckBox;
    tsWelcome: TTabSheet;
    imgLogo_2: TImage;
    imgLogo_1: TImage;
    lblAdminOrders: TLabel;
    grpUpdateOrder: TGroupBox;
    lstSelectOrderAdmin: TListBox;
    pgcAdminOrders: TPageControl;
    tsOrderUpdate: TTabSheet;
    tsOrderOutput: TTabSheet;
    redOrderOut: TRichEdit;
    btnOrderSumAdmin: TButton;
    btnOrderInfoAdmin: TButton;
    btnOrdersOutstandingPayment: TButton;
    btnOrderPhaseAdmin: TButton;
    cmbOrderPhaseSearch: TComboBox;
    edtCompanyNameSearchOrders: TEdit;
    lblCompanyNameToSearch: TLabel;
    btnSearchForOrders: TButton;
    BitBtnClearOrderSearch: TBitBtn;
    lblSelectOrderStatus: TLabel;
    rgpOrderStatus: TRadioGroup;
    btnUpdateOrderStatus: TButton;
    lblManageCompanies: TLabel;
    btnToOrdersOutput: TButton;
    btnTOorderUpdate: TButton;
    redCompanyOut: TRichEdit;
    btnCompanyOrderOut: TButton;
    btnSeatchForCompany: TButton;
    btnSearcCompAgeRange: TButton;
    edtEnterSearchCompany: TEdit;
    sedAgeBottomSearch: TSpinEdit;
    sedAgeTopSearch: TSpinEdit;
    lblSearchForComanyAge: TLabel;
    lblAgeBottom: TLabel;
    lblTopAge: TLabel;
    lblSendEmails: TLabel;
    grbNewsLetter: TGroupBox;
    memNewsLetterMessage: TMemo;
    btnSendNewsletter: TButton;
    lblWelcomeHome: TLabel;
    btnCInfoBack: TButton;
    btnLastInfoBack: TButton;
    bitbtnCloseProgram: TBitBtn;
    btnBackFromGallery: TButton;
    bitbtnRegHelp: TBitBtn;
    bitbtnLoginHelp: TBitBtn;
    bitbtnAdminHelp: TBitBtn;
    bitBtnHomeHelp: TBitBtn;
    lblPayment: TLabel;
    lstPayment: TListBox;
    lblSelectOrderToPay: TLabel;
    BitBtnPay: TBitBtn;
    redPaymentConfirm: TRichEdit;
    btnBackHomeFromPay: TButton;
    BitBtnPaymentHelp: TBitBtn;
    BitBtnretryPaySelect: TBitBtn;
    BitBtnNextToLastInfo: TBitBtn;
    BitBtnNextToConfirm: TBitBtn;
    pnlFlightAnimation: TPanel;
    imgPlaneAnimation: TImage;
    tFlightAnimation: TTimer;
    lblSelectCountry: TLabel;
    lblGalleryInfo: TLabel;
    lblConfirmYears: TLabel;
    tsThemeAdmin: TTabSheet;
    btnToTheme: TButton;
    edtSearchForItem: TEdit;
    chkChangeItemDangerous: TCheckBox;
    lblThemePage: TLabel;
    grbUpdateFormTheme: TGroupBox;
    ColorDialogFORM: TColorDialog;
    btnChangeFORMtheme: TButton;
    btnFormThemeDefault: TButton;
    grpChangeHomeTheme: TGroupBox;
    CGhomeTheme: TColorGrid;
    lblColorGridInfo: TLabel;
    lblHomeThemeInfo: TLabel;
    btnHomeThemeDefault: TButton;
    grbUpdateWelcomeLabel: TGroupBox;
    clbWelcomeLabelTheme: TColorListBox;
    btnUpdateWelcomeLabel: TButton;
    sedEnterCompanyID: TSpinEdit;
    btnLoadCompany: TButton;
    sedEnterCNameSearchOrderUpdate: TSpinEdit;
    lblEnterCompanyID: TLabel;
    btnDeleteCompanyAdmin: TButton;
    chkSuspendAccount: TCheckBox;
    btnUpdateSuspension: TButton;
    tsGrid: TTabSheet;
    btnToGrid: TButton;
    lblSortDatabase: TLabel;
    dbgGridDisplay: TDBGrid;
    qryGrid: TADOQuery;
    dsrGrid: TDataSource;
    grbGrid: TGroupBox;
    btnItemOrderPrice: TButton;
    btnToAdminManage: TButton;
    tsAdminManage: TTabSheet;
    lblManageAdmin: TLabel;
    lblEnterPlaneAmounts: TLabel;
    sedAddPlaneAmount: TSpinEdit;
    sedUpdatePlaneCount: TSpinEdit;
    lblUpdateAmountOfPlane: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRegisterGOClick(Sender: TObject);
    procedure btnLoginGOClick(Sender: TObject);
    procedure btnIntroVidClick(Sender: TObject);
    procedure btnAboutUsClick(Sender: TObject);
    procedure btnGalleryClick(Sender: TObject);
    procedure btnRegBackClick(Sender: TObject);
    procedure btnLoginBackClick(Sender: TObject);
    procedure BitBtnTOcInfoClick(Sender: TObject);
    procedure cmbCountryBasedChange(Sender: TObject);
    procedure BitBtnRegisterClick(Sender: TObject);
    procedure btnRegRestartClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnTOorderClick(Sender: TObject);
    procedure btnPlayVidClick(Sender: TObject);
    procedure btnPauseVidClick(Sender: TObject);
    procedure btnRestartVidClick(Sender: TObject);
    procedure BitBtnBackTOWelcomeFromVidClick(Sender: TObject);
    procedure btnCustomSQLClick(Sender: TObject);
    procedure btnAddCategotyClick(Sender: TObject);
    procedure btnAddItemClick(Sender: TObject);
    procedure btnRetireItemClick(Sender: TObject);
    procedure lstSelectItemManageClick(Sender: TObject);
    procedure btnUpdateItemClick(Sender: TObject);
    procedure btnUpdatePlaneClick(Sender: TObject);
    procedure dbgDifferentTablesCellClick(Column: TColumn);
    procedure btnReloadSumClick(Sender: TObject);
    procedure cmbSelectTableChange(Sender: TObject);
    procedure btnToCustomClick(Sender: TObject);
    procedure btnOrderPhaseAdminClick(Sender: TObject);
    procedure btnToOrdersOutputClick(Sender: TObject);
    procedure btnTOorderUpdateClick(Sender: TObject);
    procedure btnCompanyOrderOutClick(Sender: TObject);
    procedure btnSendNewsletterClick(Sender: TObject);
    procedure btnTOLogClick(Sender: TObject);
    procedure btnTOpaymentClick(Sender: TObject);
    procedure btnManageCompanyClick(Sender: TObject);
    procedure bitbtnCloseProgramClick(Sender: TObject);
    procedure btnBackFromGalleryClick(Sender: TObject);
    procedure BitBtnNextToConfirmClick(Sender: TObject);
    procedure btnCInfoBackClick(Sender: TObject);
    procedure BitBtnNextToLastInfoClick(Sender: TObject);
    procedure btnLastInfoBackClick(Sender: TObject);
    procedure tFlightAnimationTimer(Sender: TObject);
    procedure btnToSummaryClick(Sender: TObject);
    procedure btnToEmailsClick(Sender: TObject);
    procedure btnToItemsClick(Sender: TObject);
    procedure btnToThemeClick(Sender: TObject);
    procedure edtSearchForItemChange(Sender: TObject);
    procedure btnAddPlaneClick(Sender: TObject);
    procedure btnChangeFORMthemeClick(Sender: TObject);
    procedure btnFormThemeDefaultClick(Sender: TObject);
    Procedure imgDynamicOnclick(Sender: TObject);
    procedure btnUpdateWelcomeLabelClick(Sender: TObject);
    procedure btnSearcCompAgeRangeClick(Sender: TObject);
    procedure btnSeatchForCompanyClick(Sender: TObject);
    procedure btnLoadCompanyClick(Sender: TObject);
    procedure BitBtnretryPaySelectClick(Sender: TObject);
    procedure sedEnterCompanyIDChange(Sender: TObject);
    procedure pgcAdminChange(Sender: TObject);
    procedure btnDeleteCompanyAdminClick(Sender: TObject);
    procedure btnUpdateSuspensionClick(Sender: TObject);
    procedure btnToPlanesClick(Sender: TObject);
    procedure lstManagePlaneClick(Sender: TObject);
    procedure btnUpdateOrderStatusClick(Sender: TObject);
    procedure btnSearchForOrdersClick(Sender: TObject);
    procedure btnItemOrderPriceClick(Sender: TObject);
    procedure btnOrderSumAdminClick(Sender: TObject);
    procedure btnHomeThemeDefaultClick(Sender: TObject);
    procedure CGhomeThemeClick(Sender: TObject);
    procedure btnOrdersOutstandingPaymentClick(Sender: TObject);    // For the dynamic object
  private
    { Private declarations }

    // Class declaration
    objDistance : TDistance ;
    objUsername : TUsername ;

    Function ValidateEmail(pEmail: string): Boolean;
    Function DeleteAccount(pID : integer): boolean;


    Procedure WriteToFormTheme(pFileName : string; pColorValue : integer); // For writing to the files for system themes

  public
    { Public declarations }


  // Array declaration

    arrCountryName,  arrCountryCode : array[1..245] of string;
    arrLatitude, arrLongitude : array[1..245] of real ;

    arrSpecialCharacters : array[1..32] of char;

  // Variable declararion
  sID : string ;
  iCountryCount,  iSpecialCharacterCount : integer ;
  bTimer : boolean;

    // For the gallery
   iImageCount : integer;
  arrFileNames : array[1..1000] of string;

  // ItemUpdate ID
  iItemUpdateID : integer ;

  end;

var
  frmVolitant_Express: TfrmVolitant_Express;
  imgDynamicGallery : TImage ;

implementation

{$R *.dfm}

procedure TfrmVolitant_Express.bitbtnCloseProgramClick(Sender: TObject);
begin
// Closes/ ends the program
end;

procedure TfrmVolitant_Express.BitBtnBackTOWelcomeFromVidClick(Sender: TObject);
begin
// Go back to the welcome page from the watch video page
mpIntroVideo.Stop;     // Stop the video

// Change pages
tsIntroVideo.TabVisible := false;
tsWelcome.TabVisible:= True ;

end;


procedure TfrmVolitant_Express.BitBtnNextToConfirmClick(Sender: TObject);
var
  bUsernameFound : boolean;
  sUsernameCreated : string;
begin
    // go to the reg confirmation page from the last info page
      redConfirmRegInfo.Clear ;
     // Check to make sure that the date of the companies establishment is in the past and NOT in the furure

     if dtpEstablishedDate.Date > date then
     begin
       ShowMessage('Invalid date of establishment') ;
      Exit;
     end;


     // Fill the fields on the registration page

     pnlConfirmPass.Caption := 'You Password: ' + edtCreatePassword.Text ;
     sedCompanyAgeConfirm.Value := YearsBetween(date, dtpEstablishedDate.Date) ;

     // Richedit
     //Government agency
     if chkGovernment.Checked then
     redConfirmRegInfo.Lines.Add('Government Agency: YES')
     else
      redConfirmRegInfo.Lines.Add('Government Agency: NO') ;
   //Country based
    redConfirmRegInfo.Lines.Add('Country Based: '+ cmbCountryBased.Items[cmbCountryBased.ItemIndex]);
    // Email
     redConfirmRegInfo.Lines.Add('Email: '+ edtRegEmail.Text) ;
     // NEwsletter
     if chkNewsLetter.Checked then
      redConfirmRegInfo.Lines.Add('Newsletter: YES' )
      else
       redConfirmRegInfo.Lines.Add('Newsletter: NO');
      // Defualt hours
       redConfirmRegInfo.Lines.Add('Defualt Hours: ' + IntToStr(sedRegDefaultHours.Value) );

     tsLastInfo.TabVisible := False ;
     tsRegConfirm.TabVisible := True;

    // Inisiate the username class
    objUsername := TUsername.Create(edtCName.Text , cmbCountryBased.Items[cmbCountrybased.ItemIndex],dtpEstablishedDate.Date );

    sUsernameCreated := objUsername.ToString ;
    edtGUsername.Text := sUsernameCreated ;
    
    // Check to make sure that the username does not exist. (IT can be possible, as you cant register a company twice, however, a company starting with the same word can technically generate twice )
    repeat
      bUsernameFound := False;
      tblCompany.First ;
      while not tblCompany.eof do
      begin
        if tblCompany['Username'] = sUsernameCreated then // Check for a duplicate username
        begin
          sUsernameCreated := Copy(sUsernameCreated ,1, Pos('_', sUsernameCreated) ); // Just keep everything beforee the uudnerscore
          bUsernameFound := True; // Change to true as the username has been found
          sUsernameCreated := sUsernameCreated + IntToStr(RandomRange(1, 1000) ) ;   // Generate a new random number for after the undersocre

            objUsername.SetUsername(sUsernameCreated) ; // Update the username to the object
            break; // exit the loop to save time
        end;
        tblCompany.Next ;
      end;
      
    until bUsernameFound = False; // If no duplicate username was found, then no need to check again
    
end;

procedure TfrmVolitant_Express.BitBtnNextToLastInfoClick(Sender: TObject);
var
  sEmail : string ; 
  I, iPointPos, iATcount : integer ;
  bPoint: boolean;
begin
// Go to the Last info reg page from the contact details reg page
    sEmail := edtRegEmail.Text ;
  // Validation
 if not  ValidateEmail(sEmail) then // if the email was not correct then exit the program
 exit;

 tsContact.TabVisible := False ;
 tsLastInfo.TabVisible := True ;
 
end;

procedure TfrmVolitant_Express.BitBtnRegisterClick(Sender: TObject);
var
  sCName, sCRegPassword, sUsernameGenerated, sRegEmail, sLocationBasedReg: string;
  bGovernment, bNewsLetter : boolean;
  dDateEnstablished, dRegDate : tDate;
  iDefaultHours : integer ;
begin
// register the company

  //Confirmation
  if chkConfirmRegInfo.Checked = false then
  begin
    ShowMessage('You need to confirm that the provided info is true!');
    Exit;
  end;


  // Read values into variables
  sCName := edtCName.Text ;
  sCRegPassword := edtCreatePassword.Text ;
  sUsernameGenerated := objUsername.GetUsername ;
  sRegEmail := edtRegEmail.Text ;

   //Government agency
     if chkGovernment.Checked then
      bGovernment := True
     else
      bGovernment := false;

   dDateEnstablished := dtpEstablishedDate.Date;

   sLocationBasedReg := cmbCountryBased.Items[cmbCountryBased.ItemIndex];


    // NEwsletter
     if chkNewsLetter.Checked then
    bNewsLetter := true
      else
    bNewsLetter := False;

    dRegDate := Date;

    iDefaultHours := sedRegDefaultHours.Value ;

// Write to the db

  tblCompany.Insert ;

  tblCompany['CompanyName']:= sCName;
  tblCompany['Password'] := sCRegPassword ;
  tblCompany['Username']:= sUsernameGenerated ;
  tblCompany['Email']:= sRegEmail ;
  tblCompany['Goverment Agency']:= bGovernment ;
  tblCompany['RegDate'] := dRegDate ;
  tblCompany['Location Based'] := sLocationBasedReg ;
  tblCompany['Newsletter'] := bNewsLetter ;
  tblCompany['Establishment Date'] := dDateEnstablished ;
  tblCompany['Defualt Hours'] := iDefaultHours ;

  tblCompany.Post ;

// Go to the Home page
end;

procedure TfrmVolitant_Express.BitBtnretryPaySelectClick(Sender: TObject);
begin
// Reset the pay order list box
lstPayment.ItemIndex := -1;
end;

procedure TfrmVolitant_Express.BitBtnTOcInfoClick(Sender: TObject);
var
  sName, sPassword: string ;
  I: Integer;
  cChar, c : char;
  bErrorCharacter, bNumber, bCapital, bSpecialCharacter : boolean ;
begin
// Go to the next page of register; the Contact Info page

    sName := edtCName.Text ;
    sPassword := edtCreatePassword.Text ;
   // Validation

   // Company Name
   if (sName = '') or (sName = ' ') then
   begin
     ShowMessageUser('Please enter your Company Name') ;
     Exit;
   end;
   // Range Check
   if not ((Length(sName) >=1) and (Length(sName) <= 30 )) then
   begin
     ShowMessage('Company Name Length should be between 1 and 30 characters');
     Exit;
   end;
   // Last character may not be a space
   if sName[Length(sName) ] = ' ' then
   begin
     ShowMessage('The last character of the name may not be a space');
     exit; 
   end;
    // Check that the Company Name does not contain any elegal characters
   for I := 1 to Length(sName)  do
    begin
      if not ((sName[i] in ['A'..'Z']) or (sName[i] in ['a'..'z']) or (sName[i] in ['$', '-', ',', '.', '''', ' ']) or (sName[i] in ['0'..'9'])) then
      begin
        ShowMessage('Only alphabet characters, spaces and these special characters are allowed in the Name: '+ #13+ '$ - , . ''');
        Exit;
      end;
      
    end;

    // Check that the Company Name does not already exist (Check that the company has not been registered )
    tblCompany.first;
    while not tblCompany.Eof do
    begin
      if UpperCase(sName) = Uppercase(tblCompany['CompanyName'])  then
      begin
        ShowMessage('Company Already Registered.');
        Exit; 
      end;
    
      tblCompany.Next ;
    end;    

    // CountryBased. Make sure that a country was entered
    if cmbCountryBased.ItemIndex = -1 then
    begin
      ShowMessage('Please Select/Enter a valid Country');
      Exit; 
    end;
    
   // Password

   bNumber := False;
   bCapital := false;
   bSpecialCharacter := False;
   
   // Check that the password is in range
    if not ((Length(sPassword) >= 6) and (Length(sPassword) <= 20 )) then
    begin
      ShowMessage('Password Should be between 6 and 20 character long.');
      exit;
    end;
    // Check that the password is a valid passowrd
    for cChar  in sPassword  do
    begin

       bErrorCharacter := true;
      for c in arrSpecialCharacters do    // Checks that all the characters are valid
      begin
          if  (cChar = c) or (cChar in ['A'..'Z']) or (cChar in ['a'..'z']) or (cChar in ['0'..'9']) then
          begin
          bErrorCharacter := False ;
          break;     // exit the loop but not the procedure. Performance
          end

      end;

      if bErrorCharacter = true then
      begin
        ShowMessage('Invalid/Unsupported character in Password'+#13+'(Spaces are not allowed)')  ;
        exit;
      end ;
    

      // Check that password is secure
      if cChar in ['0'..'9'] then
      bNumber := True ;

      if cChar in ['A'..'Z'] then
       bCapital := True;

        if bSpecialCharacter = false then
        begin
            for c in arrSpecialCharacters  do
            begin
               if cChar = c then
               begin
               bSpecialCharacter := true ;

               break ;   // exit the loop but not the procedure.Performance
               end;

            end;
        end;
    
    end;
    // Password secure dialogue
    if not (bNumber = true and bCapital = true and bSpecialCharacter = true) then
    begin
      ShowMessage('Password does not meet the requirement.'+#13+'Password should contain atleast 1:'+#13+'-Special character'+#13+'-Capital Letter'+#13+'-Number');
      exit;
    end;
    // Make sure that you have entered the password that you think you have
    if not (sPassword = edtConfirmPass.Text ) then
    begin
      ShowMessage('Password do not match' )  ;
      exit;
    end;

   tsDetails.TabVisible := False;
   tsContact.TabVisible := True ;   
end;

procedure TfrmVolitant_Express.btnAboutUsClick(Sender: TObject);
begin
// Gives some background information about the company
// showmess
end;

procedure TfrmVolitant_Express.btnAddCategotyClick(Sender: TObject);
var
  sCategoryAdd, sLine : string ;
  tFile : TextFile ;
begin
// Add an item category

  sCategoryAdd := InputBox('Please type the category you would like to add:','*No duplicates allowed','') ;
  // Check that a category was entered
  if (sCategoryAdd = '') or (sCategoryAdd = ' ') then
  begin
    ShowMessage('No category entered');
    exit;
  end;
  // Check that the category is in Range
  if Length(sCategoryAdd) > 40  then
  begin
      ShowMessage('Category should be shorter or equel to 40 characters');
    exit;
  end;
// Check that the category does not exit already
    AssignFile(tFile, 'Item_Categories.txt');

  if not FileExists('Item_Categories.txt')  then  // Check that the file exists
  begin
    ShowMessage('Item_Categories.txt not Found, created');
    Rewrite(Tfile)  ;
  end;
  Reset(tFile) ;
     // Search for categories
  while not Eof(tfile)  do
  begin
    Readln(tFile, sLine) ;

    if UpperCase(sLine) = UpperCase(sCategoryAdd)   then // If the category already exists
    begin
      ShowMessage('Category already exists!') ;
      CloseFile(tFile) ;
      Exit;
    end;
  end;

  // Add item t otxt file if category does not exist
  Append(tFile);
  Writeln(tFile, sCategoryAdd) ;

  CloseFile(tFile);
  ShowMessage('Category added to combobox') ;
// Update the combobox in the end when the category has been added
cmbItemCategoryAdd.Items.Add(sCategoryAdd) ;
end;

procedure TfrmVolitant_Express.btnAddItemClick(Sender: TObject);
var
  sItemname : string;
  rPrice : real;
  bDangerous : boolean;
begin
// Add a new item to the Items table

// Validation

   // Check that a new item name was entered and that it is in range
   sItemname := edtItemAddName.Text ;
   if (sItemname = '') or (sItemname = ' ') or (Length(sItemname) > 40 ) then
   begin
      ShowMessage('No item name entered or length longer than 40 character') ;
      exit;
   end;
  // Check that the item name does not already exist
  tblItems.First ;
  while not tblItems.Eof do
  begin
    if Uppercase(sItemName) = Uppercase(tblItems['Item Name']) then
    begin
      ShowMessage('Item already exists. Update item to change anything') ;
      exit;
    end;

    tblItems.Next ;
  end;

  // Check that category is selected
  if cmbItemCategoryAdd.ItemIndex = -1 then
  begin
    ShowMessage('Please select item category') ;
    exit;
  end;

  // Check that a price is entered
  if sedAddItemRands.Value = 0 then
  begin
    ShowMessage('Enter the cost per kg for the item in Rands');
    exit;
  end;

// Remember to also validate that the description entered is shorted than the amount of characters that is allowed in that field in the db (120 at this time of writing)
  if Length(redAddDescription.Text) > 120  then
  begin
    ShowMessage('Item description should not exeed a length of 120 characters. (Currently: '+IntToStr(length(redAddDescription.Text)) +')');
    exit;
  end;

  // Add item to the database
  if chkDangerousItemAdd.Checked then
  bDangerous := true
  else
  bDangerous := False;
       // Get the price for the item
  rPrice :=sedAddItemRands.Value + (sedItemAddCents.Value  * 0.01);
{ qrySQL.SQL.Text := 'INSERT INTO tblItems (Item Name, Category, T_Cost/kg, Dangerous, Note, Retired) VALUES ('+QuotedStr(sItemname)+','+ QuotedStr(cmbItemCategoryAdd.Items[cmbItemCategoryAdd.ItemIndex]) +','+ FloatToStr(rPrice)+',' + BoolToStr(bDangerous) +','+ quotedStr(redAddDescription.Text)+','+ 'False' + ')';
  qrySQL.ExecSQL ;  }
        // ADO coding
  tblItems.Insert ;
   tblItems['Item Name'] := sItemname ;
   tblItems['Category']:= cmbItemCategoryAdd.Items[cmbItemCategoryAdd.ItemIndex];
   tblItems['T_Cost/kg'] := rPrice;
   tblItems['Dangerous']  := bDangerous ;
   tblItems['Note']:= redAddDescription.Text ;
   tblItems['Retired'] := False;
  tblItems.Post ;

  //  Update the list box
  lstSelectItemManage.Items.Add(sItemname +' -- ' + cmbItemCategoryAdd.Items[cmbItemCategoryAdd.ItemIndex] + ' -- ' +floattostrf(rPrice, ffCurrency, 10,2)) ;

  // Add item to a list box
  ShowMessage('Item successfully added');
  // Clear the inputs
  edtItemAddName.Clear ;
  cmbItemCategoryAdd.ItemIndex := -1;
  sedAddItemRands.Value := 0 ;
  sedItemAddCents.Value := 0 ;
  chkDangerousItemAdd.Checked := False;
  redAddDescription.Clear ;
end;

procedure TfrmVolitant_Express.btnAddPlaneClick(Sender: TObject);
var
  sPlaneName : string ;
begin
// Add a plane to the database

  // Validation
     // Check that a new item name was entered and that it is in range
   sPlaneName := edtAddPlaneName.Text ;
   if ( sPlaneName = '') or ( sPlaneName = ' ') or (Length( sPlaneName) > 40 ) then
   begin
      ShowMessage('No plane name entered or length longer than 40 character') ;
      exit;
   end;
  // Check that the item name does not already exist
  tblPlanes.First ;
  while not tblPlanes.Eof do
  begin
    if Uppercase( sPlaneName) = Uppercase(tblPlanes['Plane Name']) then
    begin
      ShowMessage('Plane already exists. Update plane to change anything') ;
      exit;
    end;
    tblPlanes.Next ;
  end;
  // Check that a max load was entered
  if sedAddPlaneMLoad.Value = 0 then
  begin
    ShowMessage('Enter price max load in Kg');
    exit;
  end;
  // Check that the cruising speed was entered
  if sedAddPlaneCSpeed.Value = 0 then
  begin
    ShowMessage('Enter plane cruising speed in km/h') ;
    exit ;
  end;
  // Check that a max distance was entered
  if sedAddPlaneMDistance.Value = 0 then
  begin
    ShowMessage('Enter plane max flight distance in km') ;
    exit;
  end;
  // Validate that a fuel price was entered
  if sedAddFuelRands.Value = 0 then
  begin
    ShowMessage('Enter a fuel price in Fuel Cost per hour in ZAR');
    exit;
  end;
  // Add item to the database

  tblPlanes.Insert;
   tblPlanes['Plane Name'] := sPlaneName ;
   tblPlanes['Max Load'] := sedAddPlaneMLoad.Value ;
   tblPlanes['Cruising Speed']:= sedAddPlaneCSpeed.Value ;
   tblPlanes['FuelCost'] := sedAddFuelRands.Value + sedAddFuelCents.Value / 100;
   tblPlanes['Max Distance'] := sedAddPlaneMDistance.Value ;
   tblPlanes['Retired'] := False ;
   tblPlanes['Count'] := sedAddPlaneAmount.value;
  tblPlanes.Post ;
// Update the list box
   lstManagePlane.Items.Add(IntToStr(tblPlanes['PlaneID']) +'-'+tblPlanes['Plane Name']+' -- '+ FloatToStrF(tblPlanes['FuelCost'], ffCurrency ,10,2)  );
     ShowMessage('Item successfully added'); // Confirmation
   // Clear the inputs
   edtAddPlaneName.Clear;
   sedAddPlaneMLoad.Value := 0 ;
   sedAddPlaneCSpeed.Value := 0 ;
   sedAddPlaneMDistance.Value := 0 ;
   sedAddFuelRands.Value := 0;
   sedAddFuelCents.Value := 0 ;
end;

procedure TfrmVolitant_Express.btnBackFromGalleryClick(Sender: TObject);
var
  I : integer;
begin
// Go back to the welcome page from the Gallery page
tsGallery.TabVisible := False;

  // Remove any existing dynamic compoents from the group box by freeing them from memory. I used this method in my Grade 11 PAT
  for i := sbGallery.ControlCount - 1 downto 0 do
  begin
    // Check if the control is an Image
    if sbGallery.Controls[i] is tImage then  // Is seems to be used when you are working with components and with shapes
    begin
      // Free the panel from memory and remove it from the parent owning it
      sbGallery.Controls[i].Free;
    end;
  end;


tsWelcome.TabVisible := True;
end;

procedure TfrmVolitant_Express.btnChangeFORMthemeClick(Sender: TObject);
var
  iColor : integer;
begin
// Update the theme of the Form
  if ColorDialogForm.Execute then   // Whem a color is selected from the color dialogue
  frmVolitant_Express.Color := ColorDialogFORM.Color ;  // Chnahe the forms dialogue
  // Store the color to use when starting the program again
  iColor :=ColorDialogFORM.Color ;
  // Write to file for startup theme setting
  WriteToFormTheme('Themes/formtheme.txt', iColor) ;
  ShowMessage('Form theme updated successfully') ;
end;

procedure TfrmVolitant_Express.btnCInfoBackClick(Sender: TObject);
begin
// Go back to the company info reg page from the contact info page
tsContact.TabVisible := false;
tsDetails.TabVisible := True ;
end;

procedure TfrmVolitant_Express.btnCompanyOrderOutClick(Sender: TObject);
var
  sGovernment, sPaid : string;
  bItemFound, bFirst : boolean;
begin
// Displays a list of the companies and the orders that they have places
  redCompanyOut.Clear ;

   bFirst := True;
  tblCompany.First ;
  while not tblCompany.eof do // Loop thru the companies table
  begin
   // Set the tabstops
     redCompanyOut.SelAttributes.Color := clRed;
     redCompanyOut.Paragraph.TabCount := 4;
     redCompanyOut.Paragraph.Tab[0] := 75;
     redCompanyOut.Paragraph.Tab[1] := 225;
     redCompanyOut.Paragraph.Tab[2] := 375;
     redCompanyOut.Paragraph.Tab[3] := 445;
   if bFirst = True then // Display main heading
   begin
       redCompanyOut.Lines.Add('CompanyID'+ #9+ 'Company Name'+ #9+'LocationBased'+#9+ 'Government'+ #9+'Company Age(Years)') ;
       bFirst := False;
   end;

    // Company Info display
    redCompanyOut.SelAttributes.Color := clRed ;
    if tblCompany['Goverment Agency'] = True then
    sGovernment := 'Yes'
    else
    sGovernment := 'No' ;
    redCompanyOut.Lines.Add(#13+inttostr(tblCompany['CompanyID'])+#9+tblCompany['CompanyName']+ #9+tblCompany['Location Based']+ #9+sGovernment+ #9+IntToStr(YearsBetween(Date, tblCompany['Establishment Date']) ) );


     // Setup tabstops for display of orders
    redCompanyOut.SelAttributes.Color := clGreen;
    redCompanyOut.Paragraph.TabCount := 7;
     redCompanyOut.Paragraph.Tab[0] := 65;
      redCompanyOut.Paragraph.Tab[1] := 175;
       redCompanyOut.Paragraph.Tab[2] := 300;
        redCompanyOut.Paragraph.Tab[3] := 450;
         redCompanyOut.Paragraph.Tab[4] := 550;
      redCompanyOut.Paragraph.Tab[5] := 600;
      redCompanyOut.Paragraph.Tab[6] := 690;
     redCompanyOut.Lines.Add('OrderID'+ #9+ 'Weight(kg)'+ #9 + 'Pickup Country'+ #9+'Drop-Off Country'+#9+'Status'+ #9+'Paid'+#9+'Date of Placement'+#9+'Item Name') ;

    // Get the Orders info
    tblOrders.First ;
    while not tblOrders.eof do
    begin

      if tblOrders['CompanyID'] = tblCompany['CompanyID'] then // If a order was found that is listed under the company
      begin

        // Search for the Item that's to get transported in the order
        tblItems.First ;
        bItemFound := False;
        while not tblItems.eof and (bItemFound = False) do
        begin

          if tblOrders['ItemID'] = tblItems['ItemID']  then
          begin
            bItemFound := True;

            if tblOrders['Paid'] = True then
            sPaid := 'Yes'
            else
            sPaid := 'No';

            // Set the display to display the orders info
            redCompanyOut.SelAttributes.Color := clBlack ;
            redCompanyOut.Lines.Add(inttostr(tblOrders['OrderID'])+ #9+ inttostr(tblOrders['weight'])+ #9+ tblOrders['Pickup Country']+#9+ tblOrders['Drop of Country']+#9 +tblOrders['Status']+#9+ sPaid+#9+DateToStr(tblOrders['Order Date'])+#9+tblItems['Item Name']  )   ;


          end;

        tblItems.Next;
        end;

      end;


    tblOrders.Next ;
    end;

    tblCompany.Next;
  end;


end;

procedure TfrmVolitant_Express.btnCustomSQLClick(Sender: TObject);
var
  sSQL : string ;
begin
// Run a custom SQL statement that the user entered in the edit and display in the dbg grid

sSQL := edtCustomSQL.Text;

// Validate that the length is shorter than 255 characters

  if Length(sSQL) > 255  then
  begin
       ShowMessage('Custom SQL statement is to long');
       exit;
  end;

  try   // Try, incase an invalid SQL statemnet is entered
    qrySQL.SQL.Text := sSQL;
    qrySQL.Open;
    except
    on E: Exception do // Handle the error by recieving the message
      ShowMessage('SQL/Database error: ' + E.Message);
  end;

end;

procedure TfrmVolitant_Express.btnDeleteCompanyAdminClick(Sender: TObject);
var
  iRandom : integer ;
begin
// Delete the account of the company
  // Ask for confirmation
  iRandom := RandomRange(100, 1000);
  if Inputbox('Enter code to confirm deletion', 'Code: '+ IntToStr(iRandom), '' ) = IntToStr(iRandom)  then // Confirm that you want to delete the account by typing over the given code
  begin
    if DeleteAccount(sedEnterCompanyID.Value) then  // If the Deletion was a success
    begin
      // Clear the components
      redCompanyOut.Clear ;
      sedEnterCompanyID.Value := 0;
       ShowMessage('Account of Company deleted successfully') ;
    end;
  end
  else
  ShowMessage('Deletion of account was cancelled')  ;
end;

procedure TfrmVolitant_Express.btnFormThemeDefaultClick(Sender: TObject);
begin
// Set the form theme back to the default color
frmVolitant_Express.color :=clBtnFace ;
WriteToFormTheme('Themes/formtheme.txt', clBtnFace) ;
ShowMessage('Default Form theme restored') ;
end;

procedure TfrmVolitant_Express.btnRetireItemClick(Sender: TObject);
begin
// retire an item or unretire it

  if lstSelectItemManage.ItemIndex = -1 then  // Select item to manage
  begin
    ShowMessage('Select item that exists') ;
    exit ;
  end;
      if  btnRetireItem.Caption = 'Retire Item' then  // If an item is retired
      begin
        btnRetireItem.Caption := 'UnRetire Item';
        ShowMessage('Item Retired; Press Update Item to finalize') ;
      end
      else
     begin // If item is unretired
        btnRetireItem.Caption := 'Retire Item';
        ShowMessage('Item UnRetired; Press Update Item to finalize');
     end;

end;

procedure TfrmVolitant_Express.btnGalleryClick(Sender:  TObject);   // Dynamic Component
const imgWidth = 480;
const imgHeight = 250;
var
  i, iLeft, iTop, iPerLineCount  : integer;
  bOne : boolean;
  tGalleryFile : TextFile ;
begin
// Shows some pictures about the company   (some of this code will have come from my Grade 11 PAT)

  // Create the dynamic components (images) that will be used to display the gallery

  if iImageCount = 0 then // Only read the files into the array ones; the first time the button is clicked
  begin

    // Get the name of the images into an array

    // Read image names from txt file to array
    AssignFile(tGalleryFile, 'Gallery/ImageNames.txt');
    if not FileExists('Gallery/ImageNames.txt')  then
    begin // Create the file if it does not exits
      Rewrite(tGalleryFile) ;
      ShowMessage('Gallery/ImageNames.txt was not found; created')   ;
      exit;
    end;

    Reset(tGalleryFile );
     // Read the file names into the array
    while not (Eof(tGalleryFile ) ) and (iImageCount < 1000) do
    begin
       Inc(iImageCount) ;

       Readln(tGalleryFile , arrFileNames[iImageCount]);
     //  ShowMessage(arrFileNames[imgWidth]);
    end;
    CloseFile(tGalleryFile ) ;
  end;

  // Create the image components and fill them with the images

  iPerLineCount := 0;
  iTop := 20;
  bOne := True;
  for I := 1 to iImageCount do
    begin
      if FileExists('Gallery/'+ arrFileNames[I])  then    // Check that the file can be opened by the system
      begin
    
      // Create the image
        imgDynamicGallery := TImage.Create(Self) ;
        imgDynamicGallery.Width := imgWidth ;
        imgDynamicGallery.Height := imgHeight ;
        
        imgDynamicGallery.OnClick	:= imgDynamicOnclick;

        // The the image
        imgDynamicGallery.Stretch := True;
        imgDynamicGallery.Picture.LoadFromFile('Gallery/'+ arrFileNames[I]) ;

        // Set the images locations

        // Set the position in the horisontal
        if bOne = True then
        begin
          iLeft := 20 ;
          bOne := False;
        end
        else
        begin
          iLeft := sbGallery.Width - 40 - imgWidth	 {iLeft + imgWidth + 40} ;
          bOne := True;
        end;

        Inc(iPerLineCount);

        imgDynamicGallery.Left := iLeft;
        imgDynamicGallery.Top := iTop;

        // Change the POS of the image in the vertical
        if iPerLineCount = 2 then
        begin
          iPerLineCount := 0;
          iTop := iTop + imgHeight+ 25 ;
        end;

        // Set the parent
        imgDynamicGallery.Parent := sbGallery ;
      
      end;
    end;

// go to the gallery tab sheet
tsWelcome.TabVisible := False;
tsGallery.TabVisible := true;

end;

procedure TfrmVolitant_Express.btnHomeThemeDefaultClick(Sender: TObject);
begin
// Return the home theme to default
  // Chnage the color grid back to its starting position
  CGhomeTheme.BackgroundIndex := 0 ;
  CGhomeTheme.ForegroundIndex := 0 ;
  // of the label
  lblWelcomeHome.font.Color := clMaroon    ;
  WriteToFormTheme('Themes/home_label_theme.txt', clMaroon) ;
  // of the group box
  grbHome.Color := clBtnFace ;
  WriteToFormTheme('Themes/home_grb_theme.txt', clBtnFace) ;
  ShowMessage('Themes of Home group box and home label restored to default') ;
end;

procedure TfrmVolitant_Express.btnIntroVidClick(Sender: TObject);
begin
// Plays the recorded intro video about the company

// go to anotherr tab sheet
tsWelcome.TabVisible := False;
tsIntroVideo.TabVisible := true ;

  mpIntroVideo.FileName := 'Program Media\Intro Video_5.wmv';  // Set the video file path
  mpIntroVideo.Display := pnlVideo;  // Assign the panel as the display window
  mpIntroVideo.Open;  // Open the video file
  mpIntroVideo.Play;  // Play the video
end;

procedure TfrmVolitant_Express.btnItemOrderPriceClick(Sender: TObject);
begin
  // Order the items from the items table according to their price
  qryGrid.SQL.Text := 'Select * from tblItems Order By [T_Cost/kg] DESC';
  qryGrid.Open ;
end;

procedure TfrmVolitant_Express.btnLastInfoBackClick(Sender: TObject);
begin
// Go back to the contact info reg page from the last info page
tsLastInfo.TabVisible := False;
tsContact.TabVisible := True;
end;

procedure TfrmVolitant_Express.btnLoadCompanyClick(Sender: TObject);
var
  bFound : boolean;
  sGovernment, sNewsletter, sSuspended : string ;
begin
// Load every detail of the company that was entered in the spinedit

  // Validate that a company was entered
  if sedEnterCompanyID.Value = 0 then
  begin
    ShowMessage('Enter CompanyID to find') ;
    exit;
  end;
  redCompanyOut.Clear ;
  bFound := False;
  tblCompany.First ;
  while not tblCompany.eof and (bFound = False) do   // Find the company
  begin
    if tblCompany['CompanyID'] = sedEnterCompanyID.Value then // If a matching company is found
    begin
      bFound := True;
        // Set government agency string
        if tblCompany['Goverment Agency'] =True then
        sGovernment := 'Yes'
        else
        sGovernment := 'No';
        // Set newsletter string
        if tblCompany['Newsletter'] then
        sNewsletter := 'Yes'
        else
        sNewsletter := 'No' ;
        // Set the suspended string
        if tblCompany['Suspended'] then
        begin     // If the account is suspended
          sSuspended := 'Yes';
          chkSuspendAccount.Checked := True;  // Update the check box for suspension
        end
        else
         begin
            sSuspended := 'No';
            chkSuspendAccount.Checked := False;
         end;
      // Display the company info
      redCompanyOut.SelStart := 0 ;
      redCompanyOut.SelLength := 10;
      redCompanyOut.SelAttributes.Size := 14;
      redCompanyOut.lines.Add('Company Name: '+tblCompany['CompanyName']) ; // company name
      redCompanyOut.lines.Add('Username: '+tblCompany['Username']) ; // Username
      redCompanyOut.lines.Add('Password: '+tblCompany['Password']) ; // Password
      redCompanyOut.Lines.Add('Email: '+tblCompany['Email']) ;       // Email
      redCompanyOut.lines.Add('Location Based: '+tblCompany['Location Based']) ; // Location Based
      redCompanyOut.lines.Add('Government: ' + sGovernment) ; // Government agency
      redCompanyOut.lines.Add('Newsletter: '+ sNewsletter) ; // Newsletter
      redCompanyOut.lines.Add('Registration Date: ' + DateToStr(tblCompany['Regdate']) ) ;  // Reg date
      redCompanyOut.lines.Add('Company Age: ' + IntToStr(YearsBetween(Date, tblCompany['Establishment Date']) ) ) ;// date of establishment
      redCompanyOut.lines.Add('Default Hours: ' + IntToStr(tblCompany['Defualt Hours']) ) ;  // The companies defualt hours
      redCompanyOut.Lines.Add('Suspended: '+ sSuspended ) ; // suspended

    end;
  tblCompany.Next ;
  end;
    // If no company was found
  if bFound = False then
  begin
     redCompanyOut.Lines.Add('No Matching Company Found') ;
     exit;
  end;

  // enable the company controll buttons if a comany is found
   btnDeleteCompanyAdmin.Enabled := true;
  chkSuspendAccount.Enabled := true;
  btnUpdateSuspension.Enabled := True;
end;

procedure TfrmVolitant_Express.btnLoginBackClick(Sender: TObject);
begin
// Go back to the welcome page from the login page
tsLogin.TabVisible := false;
tsWelcome.TabVisible := True;
end;

procedure TfrmVolitant_Express.btnLoginClick(Sender: TObject);
begin
// Login to the program

  // Perhaps add SQL Injection protection

  qrySQL.SQL.Text := 'Select CompanyID, Suspended from tblCompany where (Username = ' + QuotedStr(edtUsernameLogin.Text) + ') and Password = '+ QuotedStr(edtPasswordLogin.Text) ;  // SQL Query

   qrySQL.Open ;

  if not qrySQL.IsEmpty then  // Checks that the field (Query) does not come up empty
  begin
   //  qrySQL.First ;
    if qrySQL['Suspended'] = False then  // if the account is not suspended
    begin

     sID := inttostr(qrySQL['CompanyID'])  ;

     ShowMessage('Logged in succesfully!');
      // Change the tabsheets
     tsLogin.TabVisible := False;
     tsHome.TabVisible := True ;
    end
    else
    begin // If the account is suspended
      ShowMessage('Account is suspended'+ #13+'Contact admins to resolve your issue')  ;
    end;
  end
  else
  begin  // If it was an invalid login
    Showmessage('Invalid Password or username!') ;
    Exit;
  end;

end;

procedure TfrmVolitant_Express.btnLoginGOClick(Sender: TObject);
begin
// Go to the Login page
tsWelcome.TabVisible :=  false ;
tsLogin.TabVisible := True;
end;

procedure TfrmVolitant_Express.btnManageCompanyClick(Sender: TObject);
begin
// Go to the page to manage company info page from the home page
tsHome.TabVisible := False;
tsManageCompany.TabVisible := true;
end;

procedure TfrmVolitant_Express.btnOrderPhaseAdminClick(Sender: TObject);
var
  bItemFound : boolean;
  sPaid : string;
begin
// Search and list orders that are in a spesific phase

// Validation
  if cmbOrderPhaseSearch.ItemIndex = -1 then
  begin
    ShowMessage('Select phase to search from above box') ;
    exit;
  end;

  // Search and display orders in phase
    // Set tab stops
    redorderout.Clear ;
    // Set heading for search
    redOrderOut.SelAttributes.Size := 14;
   redOrderOut.Lines.Add('Order in phase: '+ cmbOrderPhaseSearch.Items[cmbOrderPhaseSearch.ItemIndex]) ;
     // Setup tabstops for display of orders in that phase
    redOrderout.SelAttributes.Color := clGreen;
    redOrderout.Paragraph.TabCount := 8;
      redOrderout.Paragraph.Tab[0] := 60;   // OrderID
  redOrderout.Paragraph.Tab[1] := 130;  // CompanyID
  redOrderout.Paragraph.Tab[2] := 210;  // Weight(kg)
  redOrderout.Paragraph.Tab[3] := 300;  // Pickup Country
  redOrderout.Paragraph.Tab[4] := 440;  // Drop-Off Country
  redOrderout.Paragraph.Tab[5] := 580;  // Status
  redOrderout.Paragraph.Tab[6] := 650;  // Paid
  redOrderout.Paragraph.Tab[7] := 720;  // Date of Placement
    redOrderout.Lines.Add('OrderID'+#9+'CompanyID'+ #9+ 'Weight(kg)'+ #9 + 'Pickup Country'+ #9+'Drop-Off Country'+#9+'Status'+ #9+'Paid'+#9+'Date of Placement'+#9+'Item Name'+ #13) ;

    // find the orders
    tblOrders.First;
    while not tblOrders.Eof do
    begin
        if tblOrders['Status'] = cmbOrderPhaseSearch.Items[cmbOrderPhaseSearch.ItemIndex]  then // If a order was found that is listed under the status beign searched for
        begin
          // Search for the Item that's to get transported in the order
          tblItems.First ;
          bItemFound := False;
          while not tblItems.eof and (bItemFound = False) do
          begin

            if tblOrders['ItemID'] = tblItems['ItemID']  then
            begin
              bItemFound := True;
                // Get if the order was paid in string form
              if tblOrders['Paid'] = True then
              sPaid := 'Yes'
              else
              sPaid := 'No';

              // Set the display to display the orders info
              redOrderOut.SelAttributes.Color := clBlue  ;
              redOrderOut.Lines.Add(inttostr(tblOrders['OrderID'])+ #9+inttostr(tblOrders['CompanyID'])+#9+ inttostr(tblOrders['weight'])+ #9+ tblOrders['Pickup Country']+#9+ tblOrders['Drop of Country']+#9 +tblOrders['Status']+#9+ sPaid+#9+DateToStr(tblOrders['Order Date'])+#9+tblItems['Item Name']  )   ;
            end;
          tblItems.Next;
          end;

        end;
        tblOrders.Next ;
    end;
end;

procedure TfrmVolitant_Express.btnOrdersOutstandingPaymentClick(Sender: TObject);
var
  bItemFound : boolean ;
  sPaid : string;
  iUnpaidCount : integer;
begin
// Display all orders with outstandigng payments. Exlude canecelled orders
  redOrderOut.Clear ;
     // Setup tabstops for display of orders in that phase
    redOrderout.SelAttributes.Color := clPurple ;
    redOrderout.Paragraph.TabCount := 8;
      redOrderout.Paragraph.Tab[0] := 60;   // OrderID
  redOrderout.Paragraph.Tab[1] := 130;  // CompanyID
  redOrderout.Paragraph.Tab[2] := 210;  // Weight(kg)
  redOrderout.Paragraph.Tab[3] := 300;  // Pickup Country
  redOrderout.Paragraph.Tab[4] := 440;  // Drop-Off Country
  redOrderout.Paragraph.Tab[5] := 580;  // Status
  redOrderout.Paragraph.Tab[6] := 650;  // Paid
  redOrderout.Paragraph.Tab[7] := 720;  // Date of Placement
    redOrderout.Lines.Add('OrderID'+#9+'CompanyID'+ #9+ 'Weight(kg)'+ #9 + 'Pickup Country'+ #9+'Drop-Off Country'+#9+'Status'+ #9+'Paid'+#9+'Date of Placement'+#9+'Item Name'+ #13) ;

    // find the orders
    iUnpaidCount := 0 ;
    tblOrders.First;
    while not tblOrders.Eof do
    begin
        if (tblOrders['Paid'] = False) and not (tblOrders['Status'] = 'Canceled')  then // If a order was found that's not paid and not cancelled
        begin
          // Search for the Item that's to get transported in the order
          tblItems.First ;
          Inc(iUnpaidCount);
          bItemFound := False;
          while not tblItems.eof and (bItemFound = False) do
          begin

            if tblOrders['ItemID'] = tblItems['ItemID']  then
            begin
              bItemFound := True;
                // Get if the order was paid in string form
              if tblOrders['Paid'] = True then
              sPaid := 'Yes'
              else
              sPaid := 'No';

              // Set the display to display the orders info
              redOrderOut.SelAttributes.Color := clBlue  ;
              redOrderOut.Lines.Add(inttostr(tblOrders['OrderID'])+ #9+inttostr(tblOrders['CompanyID'])+#9+ inttostr(tblOrders['weight'])+ #9+ tblOrders['Pickup Country']+#9+ tblOrders['Drop of Country']+#9 +tblOrders['Status']+#9+ sPaid+#9+DateToStr(tblOrders['Order Date'])+#9+tblItems['Item Name']  )   ;
            end;
          tblItems.Next;
          end;

        end;
        tblOrders.Next ;
    end;
    // Dispaly a counter
    redOrderOut.SelAttributes.Size := 13;
    redOrderOut.Lines.Add(#13+'There are a total of ' + IntToStr(iUnpaidCount)+ ' unpaid orders' ) ;
end;

procedure TfrmVolitant_Express.btnOrderSumAdminClick(Sender: TObject);
begin
// Give a summary about stats everything order related

end;

procedure TfrmVolitant_Express.btnPauseVidClick(Sender: TObject);
begin
// Pause the video
mpIntroVideo.Pause ;
end;

procedure TfrmVolitant_Express.btnPlayVidClick(Sender: TObject);
begin
// Play the video if the video was paused
mpIntroVideo.Resume ;
end;

procedure TfrmVolitant_Express.btnRegBackClick(Sender: TObject);
begin
// Go back to the Welcome page from the Register page

  // clear all of the fields

tsRegister.TabVisible := False;
tsWelcome.TabVisible := True ;
end;

procedure TfrmVolitant_Express.btnRegisterGOClick(Sender: TObject);
begin
// Go to the register page
tsWelcome.TabVisible := false ;
tsRegister.TabVisible := True ;
end;

procedure TfrmVolitant_Express.btnRegRestartClick(Sender: TObject);
begin
// Restarts the regestration from the begining, does not clear any fields
chkConfirmRegInfo.Checked := False;
tsRegConfirm.TabVisible := False;
tsDetails.TabVisible := True ;
end;

procedure TfrmVolitant_Express.btnReloadSumClick(Sender: TObject);
const RevenueGoal = 1000000000;
const OrdersGoal = 100;
var
  iNum, iYearlyOrdersGoal : integer ;
  sString : string;
  rRevenue, rHours, rYearlyRevenueGoal : real;
  bFound : boolean;
begin
// Reloads the page; updating the info

 // Total Accounts
 pnlTotalAccounts.Caption := 'Total Accounts: ' + IntToStr(tblCompany.RecordCount); 
 // total Orders
 pnlTotalOrders.Caption :='Total Orders: '+ IntToStr(tblOrders.RecordCount );
 // Total Items
 pnlTotalItems.Caption := 'Total Items: ' + IntToStr(tblItems.RecordCount) ;
 // Total Planes
 qrySQL.SQL.Text := 'Select SUM(Count) as Result from tblPlanes' ;
 qrySQL.Open ;
 pnlTotalPlanes.Caption := 'Total Planes: ' + IntToStr(qrySQL['Result']) ;

 // Top plain
 qrySQL.SQL.Text := 'SELECT TOP 1 PlaneID AS Result FROM tblOrders Group By PlaneID ORDER BY Count(*) DESC';
  qrySQL.Open ;  
 iNum := qrySQL['Result'];
 qrySQL.SQL.Text := 'Select [Plane Name] as Result from tblPlanes where PlaneID = '+ IntToStr(iNum);
 qrySQL.Open ; 
 sString := qrySQL['Result'];
  lblTopPlain.Caption := 'Top Plain: ' + sString ;

  //  Top Item  
  qrySQL.SQL.Text := 'Select TOP 1 [Item Name] As Result from tblItems, tblOrders where tblOrders.ItemID = tblItems.itemID Group By tblItems.[Item Name] ORDER BY Count(*) DESC'; 
  qrySQL.Open ;
  lblTopItem.Caption := 'Top Item: ' + qrySQL['Result']; 

  // Top Pickup Country
  qrySQL.SQL.Text := 'Select TOP 1 [Pickup Country] as Result from tblOrders Group By [Pickup Country] Order By Count(*) DESC'  ;
   qrySQL.Open ;
   lblTopPickupC.Caption := 'Top Pickup Country: ' + qrySQL['Result'] ;

   // Drop of Country
   qrySQL.SQL.Text := 'Select TOP 1 [Drop of Country] as Result from tblOrders Group By [Drop of Country] Order By Count(*) DESC'  ;
   qrySQL.Open ;
   lblTopDropoffC.Caption := 'Top Drop-Off Country: ' + qrySQL['Result'] ;

   // Total Revenue for all time calculation
   rRevenue := 0 ;
   rYearlyRevenueGoal := 0 ;
   iYearlyOrdersGoal := 0;
   tblOrders.First ;
   while not tblOrders.eof do   // Loop thru tblOrders
   begin
      if tblOrders['Paid'] = true then   // Checks that the order has been paid, before adding it to revenue sum
      begin

        rRevenue := rRevenue + tblOrders['Base Cost'] ; // Add the base cost to total revenue
        tblItems.First ;

        if (YearOF(tblOrders['Pickup Date']) = YearOf(Date))  then // inc the orders that occured this year specificaly counter
        Inc(iYearlyOrdersGoal) ;


        bFound := False;
        while not tblItems.eof and (bFound = false) do // Loop thru items table to get the price for an item per kg
        begin

          if tblItems['ItemID'] = tblOrders['ItemID'] then
          begin
          bFound := true;
            rRevenue := rRevenue + tblItems['T_Cost/kg'] * tblOrders['Weight'] ;

             if (YearOF(tblOrders['Pickup Date']) = YearOf(Date))  then  // increase the revenue that was made this year only
             rYearlyRevenueGoal := rYearlyRevenueGoal +  tblItems['T_Cost/kg'] * tblOrders['Weight'] ;
          end;

          tblItems.Next ;
        end;
        bFound := False;
        // Loop thru plane table to get feul price

        tblPlanes.First;
        while not tblPlanes.Eof and (bFound = false) do
        begin
           if tblPlanes['PlaneID'] = tblOrders['PlaneID'] then
           begin
              bFound := True;
              // Calculate the hours that the flight will last
              rHours  := (tblOrders['E/D Date'] - tblOrders['Pickup Date']) * 24 ; // Get the difference in time and convert it to hours
              rRevenue := rRevenue + tblPlanes['FuelCost']  * rHours  ; // times by the hours of the flight

                 if (YearOF(tblOrders['Pickup Date']) = YearOf(Date))  then  // increase the revenue that was made this year only
             rYearlyRevenueGoal := rYearlyRevenueGoal +  tblPlanes['FuelCost']  * rHours  ;
           end;

          tblPlanes.Next ;
        end;
      
      end;
      tblOrders.Next ;
   end;
   lblTotalRevenue.Caption := 'Total Revenue: ' + FloatToStrF(rRevenue , ffCurrency ,10,2)  ;

   // Average Order Weight
    qrySQL.SQL.Text := 'Select AVG(Weight) as Result from tblOrders'  ;
   qrySQL.Open ;
   lblAverageWeight.Caption := 'Average Order Weight: ' + floattostrf((qrySQL['Result']), ffFixed, 10,2) + ' kg';
   
  // Set the progress bars for the yearly goals

  // For revenue goal
  PBrevenue.Min := 0;
  PBrevenue.Max := 100;

PBrevenue.Position := Floor(rYearlyRevenueGoal / RevenueGoal* 100 ) ;



  // For the order goal
  PBOrders.Min := 0 ;
  PBOrders.Max := 100;
PBOrders.Position := Floor(iYearlyOrdersGoal / OrdersGoal *100);
end;

procedure TfrmVolitant_Express.btnRestartVidClick(Sender: TObject);
begin
// Restart the video if it played fully or go to the beginnign of the video at any time
mpIntroVideo.Stop;     // Stop the video
mpIntroVideo.Position := 0; // Sets the video's time to the begining
mpIntroVideo.Play;     // Restart the video
end;

procedure TfrmVolitant_Express.btnSearcCompAgeRangeClick(Sender: TObject);
var
  iAge, iCount : integer ;
  sGovernment : string;
begin
// Search for companies in an age range
  // Validation
  if sedAgeTopSearch.Value < sedAgeBottomSearch.Value then
  begin
    ShowMessage('Upper year may not be lower than lower year');
    exit;
  end;
  iAge := 0;

  redCompanyOut.Clear ;
     // Set the tabstops
     redCompanyOut.SelAttributes.Color := clRed;
     redCompanyOut.Paragraph.TabCount := 5;
     redCompanyOut.Paragraph.Tab[0] := 75;
     redCompanyOut.Paragraph.Tab[1] := 225;
     redCompanyOut.Paragraph.Tab[2] := 375;
     redCompanyOut.Paragraph.Tab[3] := 445;
     redCompanyOut.Paragraph.Tab[4] := 560;
    redCompanyOut.Lines.Add('CompanyID'+ #9+ 'Company Name'+ #9+'LocationBased'+#9+ 'Government'+ #9+'Company Age(Years)'+ #9+ 'Total Orders'+ #13) ;
  tblCompany.First ;
  while not tblCompany.eof do
  begin
    iAge := YearsBetween(Date, tblCompany['Establishment Date']);

    if (  iAge >= sedAgeBottomSearch.Value) and (  iAge <= sedAgeTopSearch.Value)  then // Companies in the age range
    begin
      iCount := 0;
      tblOrders.First ;
      while not tblOrders.Eof do    // Count the orders that the company has made
      begin
        if tblCompany['CompanyID'] = tblOrders['CompanyID'] then  // Where the company has an order
        begin
          Inc(iCount)  ;
        end;

        tblOrders.Next ;
      end;
      // Set the government variable
      if tblCompany['Goverment Agency'] = true then
      sGovernment := 'Yes'
      else
      sGovernment := 'No';
      // Display the company info
      redCompanyOut.Lines.Add(IntToStr(tblCompany['CompanyID']) + #9 + tblCompany['CompanyName']+ #9+ tblCompany['Location Based']+#9+sGovernment  +#9+ IntToStr(iAge)+#9+IntToStr(iCount)) ;
    end;
    tblCompany.Next ;
  end;
end;

procedure TfrmVolitant_Express.btnSearchForOrdersClick(Sender: TObject);
begin
// Show all orders


// Add button for displaying orders that will be due in short time
end;

procedure TfrmVolitant_Express.btnSeatchForCompanyClick(Sender: TObject);
var
  iOrderCount : integer;
  sGovernment : string ;
begin
// Search for a company based on the company name
  // Set the tab stops
    redCompanyOut.Clear ;
     redCompanyOut.SelAttributes.Color := clRed;
     redCompanyOut.Paragraph.TabCount := 4;
     redCompanyOut.Paragraph.Tab[0] := 75;
     redCompanyOut.Paragraph.Tab[1] := 225;
     redCompanyOut.Paragraph.Tab[2] := 375;
     redCompanyOut.Paragraph.Tab[3] := 445;
     redCompanyOut.Lines.Add('CompanyID'+ #9+ 'Company Name'+ #9+'LocationBased'+#9+ 'Government'+ #9+ 'Total Orders'+ #13) ;

     redCompanyOut.SelAttributes.Color := clBlack ;
  tblCompany.First ;
  while not tblCompany.eof do
  begin
     if Pos(UpperCase(edtEnterSearchCompany.Text), UpperCase(tblCompany['CompanyName'])  )> 0  then   // Find names that matches what was entered in the edit
     begin
        iOrderCount := 0 ;
        // Count orders that the company has placed
        tblOrders.First ;
        while not tblOrders.eof do
        begin
            // Finder orders under the company
            if tblCompany['CompanyID'] = tblOrders['CompanyID'] then
            Inc(iOrderCount);

          tblOrders.Next ;
        end;
           // Get government agency string
        if tblCompany['Goverment Agency'] =True then
        sGovernment := 'Yes'
        else
        sGovernment := 'No';

        redCompanyOut.Lines.Add(IntToStr(tblCompany['CompanyID']) +#9+ tblCompany['CompanyName']+#9+ tblCompany['Location Based']+#9+sGovernment+#9+IntToStr(iOrderCount) ) ;
     end;

    tblCompany.Next ;
  end;

end;

procedure TfrmVolitant_Express.btnSendNewsletterClick(Sender: TObject);
begin
// Send the newsletter
end;

procedure TfrmVolitant_Express.btnToCustomClick(Sender: TObject);
var
  sCustomPagePass : string;
begin
// Go to the custom SQL page, ask for a special password to gain access to this part of the website

  sCustomPagePass := IntToStr(RandomRange(1000, 10000) )  ;

  if sCustomPagePass = InputBox('Enter Password to access Custom SQL page', 'The Custom Passowd is: (For PAT purposes it is given)', sCustomPagePass)  then
  begin
   pgcAdmin.ActivePage.TabVisible := False;
   tsCustomAdmin.TabVisible := True;
  end
  else
  begin
    ShowMessage('You got the Password WRONG') ;
   Exit;
  end;

end;

procedure TfrmVolitant_Express.btnToEmailsClick(Sender: TObject);
begin
// Go to the admin email page from any of the other pages
pgcAdmin.ActivePage.TabVisible := False;
tsEmailsAdmin.TabVisible := True;
end;

procedure TfrmVolitant_Express.btnToItemsClick(Sender: TObject);
begin
 // Go to the Items page from any of the other pages
 pgcAdmin.ActivePage.TabVisible := False;
 tsItemsAdmin.TabVisible := True;

   if not FileExists('Item_Categories.txt')  then  // Check that the categories file does exist
  begin
    ShowMessage('Item_Categories.txt not Found. Add categories to resolve this problem');
    Exit;
  end;
  // Load the different categories into the combo box
 cmbItemCategoryAdd.Items.LoadFromFile('Item_Categories.txt') ;

 // Load a list of all the items into the list box to update them
 lstSelectItemManage.Clear;

 tblItems.First ;
 while not tblItems.eof do
 begin
      // Load item into the list box
    lstSelectItemManage.Items.Add(tblItems['Item Name'] + ' -- '+ tblItems['Category']+ ' -- '+floattostrf(tblItems['T_Cost/kg'], ffCurrency,10,2));
  tblItems.Next ;
 end;
 iItemUpdateID := 0 ;


   // clear update inputs
  edtSearchForItem.Clear ;
  sedUpdateItemRands.Value := 0;
  sedUpdateItemCents.Value := 0;
  chkChangeItemDangerous.Checked := False;
  redUpdateItem.Clear ;
  lstSelectItemManage.ItemIndex := -1;

  // Disable the company management buttons
  btnDeleteCompanyAdmin.Enabled := False;
  chkSuspendAccount.Enabled := False;

end;

procedure TfrmVolitant_Express.btnTOLogClick(Sender: TObject);
begin
// Go to the page to View logs page from the home page
tsHome.TabVisible := False;
tsLog.TabVisible := True ;
end;

procedure TfrmVolitant_Express.btnTOorderClick(Sender: TObject);
begin
// Go to the page to place an order for a transport from the home page
tsHome.TabVisible := False;
tsPOrder.TabVisible := True ;
end;



procedure TfrmVolitant_Express.btnToOrdersOutputClick(Sender: TObject);
begin
// Go to the orders output page from the orders update page
pgcAdminOrders.ActivePage := tsOrderOutput;
end;

procedure TfrmVolitant_Express.btnTOorderUpdateClick(Sender: TObject);
begin
// Go to the update orders page from the order output page
pgcAdminOrders.ActivePage := tsOrderUpdate ;
end;

procedure TfrmVolitant_Express.btnTOpaymentClick(Sender: TObject);
begin
// Go to the page to manage payments page from the home page
tsHome.TabVisible := False;
tsPayment.TabVisible := True ;

  // Load all payable orders into the list box

end;

procedure TfrmVolitant_Express.btnToPlanesClick(Sender: TObject);
begin
// Change the active admin page to Plane management
pgcAdmin.ActivePage.TabVisible := False;
tsPlanesAdmin.TabVisible := True ;
  // Load the manage plane list box
  tblPlanes.First ;
  while not tblPlanes.eof do
  begin         // Load into a list box
    lstManagePlane.Items.Add(IntToStr(tblPlanes['PlaneID']) +'-'+tblPlanes['Plane Name']+' -- '+ FloatToStrF(tblPlanes['FuelCost'], ffCurrency ,10,2)  );
    tblPlanes.Next ;
  end;
  lstManagePlane.ItemIndex := -1 ;

end;

procedure TfrmVolitant_Express.btnToSummaryClick(Sender: TObject);
begin
// Go to the summary page and load the info on the page
  pgcAdmin.ActivePage.TabVisible := false;
  tsAdminSum.TabVisible := True;
  btnReloadSum.Click  ;
end;

procedure TfrmVolitant_Express.btnToThemeClick(Sender: TObject);
begin
// go the the theme change admin page from any other of the admin pages
end;

procedure TfrmVolitant_Express.btnUpdateItemClick(Sender: TObject);
var
  bFound : boolean ;
begin
// Update the item

// Validation
    // Ensure that item was selected to update
  if lstSelectItemManage.ItemIndex = -1 then
  begin
    ShowMessage('Select item to manage') ;
    exit ;
  end;
  if sedUpdateItemRands.Value = 0 then // Emsure that item transport price was entered
  begin
    ShowMessage('Enter an amount of money for the item') ;
    exit;
  end;
    // Ensure that the note of the item is in range
  if Length(redUpdateItem.Text) > 120 then
  begin
    ShowMessage('Item Note may not be longer than 120 chracters');
    exit;
  end;

    // Update the item
    tblItems.First ;
    bFound := false;
    while not tblItems.eof and (bFound = False) do
    begin
      if iItemUpdateID = tblItems['ItemID'] then  // if a matching item is found
      begin
        bFound := True ;
          tblItems.Edit ;
        tblItems['T_Cost/kg'] := sedUpdateItemRands.Value + (sedUpdateItemCents.Value / 100);
        tblItems['Dangerous'] := chkChangeItemDangerous.Checked ;
        tblItems['Note'] := redUpdateItem.Text ;
        // Update the retire item part
        if  btnRetireItem.Caption = 'Retire Item' then
        begin
          tblItems['Retired'] := False;
        end
        else
        begin
           tblItems['Retired'] := True;
        end;

        tblItems.Post ;
        // Update the listbox
        lstSelectItemManage.Items[lstSelectItemManage.ItemIndex] := tblItems['Item Name'] + ' -- '+ tblItems['Category']+ ' -- '+floattostrf(tblItems['T_Cost/kg'], ffCurrency,10,2) ;

      end
      else
    tblItems.Next ;
    end;

  // clear update inputs
  edtSearchForItem.Clear ;
  sedUpdateItemRands.Value := 0;
  sedUpdateItemCents.Value := 0;
  chkChangeItemDangerous.Checked := False;
  redUpdateItem.Clear ;
  lstSelectItemManage.ItemIndex := -1;

  ShowMessage('Item updated successfully') ;
end;

procedure TfrmVolitant_Express.btnUpdateOrderStatusClick(Sender: TObject);
begin

  // Only allow certain functions if a company, say has paid

  // Remember to update date that the trip took

  // Suspounded account order not to be processed
end;

procedure TfrmVolitant_Express.btnUpdatePlaneClick(Sender: TObject);
var
  iPlaneID, iPlainUseCount : integer;
  bFound : boolean ;
begin
// Update the plane info

  // Validation
    // Validate that plane is selected
    if lstManagePlane.ItemIndex = -1 then
    begin
      ShowMessage('Select a plane to update');
      exit;
    end;
    // Validate that a fuel price was entered
    if sedUpdateFuelRands.Value = 0  then
    begin
      ShowMessage('Enter a fuel price for the Plane') ;
      exit;
    end;
      // Get the planeID
    iPlaneID  := StrToInt(Copy(lstManagePlane.Items[lstManagePlane.ItemIndex], 1, Pos('-',lstManagePlane.Items[lstManagePlane.ItemIndex])-1 ) ) ;
    // Ensure that the amount of plains after the plain count update, is not less than the amount of plains being used in orders currently
    iPlainUseCount := 0 ;
    tblOrders.First ;
    while not tblOrders.Eof do
    begin
         if tblOrders['PlaneID'] = iPlaneID then // If a matching order was found
         begin
          if not (tblOrders['Status'] = 'Delivered') and not (tblOrders['Status']= 'Canceled') then  // If the plain is still being used, inc the amount of plains beign used counter
          begin
            Inc(iPlainUseCount) ;
          end;
         end;
      tblOrders.Next ;
    end;
      // Check that enough planes will be left overs
      if iPlainUseCount > sedUpdatePlaneCount.Value then
      begin
        ShowMessage('Not enough planes left for amount used in active orders'+#13+'Wait untill all orders are handeled before lowering the coount'+#13+ 'Retire plain temporarly to prevent more orders from beign added to plain. Update plain count after all orders using it was handeled and then unretire plain');
        exit; 
      end;
    // update the plane
      bFound := false;
      tblPlanes.First ;
      while not tblPlanes.Eof and (bFound = False) do
      begin
        if tblPlanes['PlaneID'] = iPlaneID then // If a matching record was found
        begin
          bFound := True;
          // Update the plane
          tblPlanes.Edit ;
          tblPlanes['Retired'] := chkRetirePlane.Checked ;
          tblPlanes['FuelCost'] := sedUpdateFuelRands.Value + sedUpdateFuelCents.Value / 100;
          tblPlanes['Count']:= sedUpdatePlaneCount.Value ;
          tblPlanes.Post ;
           // Update the listbox
          lstManagePlane.Items[lstManagePlane.ItemIndex] := IntToStr(tblPlanes['PlaneID']) +'-'+tblPlanes['Plane Name']+' -- '+ FloatToStrF(tblPlanes['FuelCost'], ffCurrency ,10,2)  ;
        end
        else
        tblPlanes.Next ;
      end;

    // Clear inputs
    chkRetirePlane.Checked := False;
    sedUpdateFuelRands.Value := 0;
    sedUpdateFuelCents.Value := 0;
    sedUpdatePlaneCount.Value := 1 ;
    lstManagePlane.ItemIndex := -1;
    // Confirmation if successfull
    ShowMessage('Plane updated successfully') ;
end;

procedure TfrmVolitant_Express.btnUpdateSuspensionClick(Sender: TObject);
var
  bSuspended : boolean;
  sSuspended : string;
begin
// Read the suspension update to the database
  // Set boolean var for db updation
  if chkSuspendAccount.Checked then
  begin
    bSuspended := True;
    sSuspended := 'Yes' ;
  end
  else
  begin
    bSuspended := False;
    sSuspended := 'No';
  end;

  // Update the suspension
  qrySQL.SQL.Text := 'Update tblCompany Set Suspended = ' + booltostr(bSuspended) + ' where CompanyID = ' + IntToStr(sedEnterCompanyID.Value)   ;
  qrySQL.ExecSQL ;
  // Update the last line in the richedit containign info about the companies suspension

  redCompanyOut.Lines[redCompanyOut.Lines.Count - 1] := 'Suspended: '+ sSuspended;    // Update the last line; last line will always be the suspended line

  ShowMessage('Updated suspension successfully');
end;

procedure TfrmVolitant_Express.btnUpdateWelcomeLabelClick(Sender: TObject);
begin
// Update the welcome lable color theme
  lblWelcome.font.Color := clbWelcomeLabelTheme.Selected;
  WriteToFormTheme('Themes/welcome_label_theme.txt', clbWelcomeLabelTheme.Selected) ;
  ShowMessage('Welcome label theme updated');
end;

procedure TfrmVolitant_Express.cmbCountryBasedChange(Sender: TObject);
var
  sFileName, sCountryName : string;
  I: Integer;
begin
// Display the flag of the selected Based country in the image component

  if cmbCountryBased.ItemIndex >=0 then // Make sure than an option was selected
  begin
    sFileName := 'Flags/' + arrCountryCode[cmbCountryBased.ItemIndex+1] + '.jpg';  // Create the name of the file to open
    if FileExists(sFileName) then
    imgBasedFlag.Picture.LoadFromFile(sFileName) // Load the image
    else
    imgBasedFlag.Picture.LoadFromFile('Flags/Not_Found.jpg') ;    // If, for some reason, The file cannot be found, display not found
  end
  else
   imgBasedFlag.Picture.LoadFromFile('Flags/Not_Found.jpg') ; // If no valid images was selected

end;

procedure TfrmVolitant_Express.cmbSelectTableChange(Sender: TObject);
begin
// Change the table being displayed in dbgDifferentTable

  case cmbSelectTable.ItemIndex of             // Set a data source to be active in the table
  0: dbgDifferentTables.DataSource := dsrOrders ;
  1: dbgDifferentTables.DataSource := dsrPlanes ;
  2: dbgDifferentTables.DataSource := dsrCompany ;
  3: dbgDifferentTables.DataSource := dsrItems ;
  end;
end;

procedure TfrmVolitant_Express.CGhomeThemeClick(Sender: TObject);
begin
// Change the theme of the home page
  // Change the color of the label
  lblWelcomeHome.font.Color := CGhomeTheme.ForegroundColor ;
   WriteToFormTheme('Themes/home_label_theme.txt',CGhomeTheme.ForegroundColor) ;
   // Change the theme of the group box
   grbHome.Color := CGhomeTheme.BackgroundColor ;
   WriteToFormTheme('Themes/home_grb_theme.txt', CGhomeTheme.BackgroundColor) ;

   ShowMessage('Theme of Home group box and label Updated')
end;

procedure TfrmVolitant_Express.dbgDifferentTablesCellClick(Column: TColumn);
begin
// If the active table is tblOrders: when a record is clicked on: Retrieve all the foreign data from the other tables and dispay info about that record in a showmessage
end;

function TfrmVolitant_Express.DeleteAccount(pID: integer): boolean;
begin   // Return if the deletetion was successfull
// Delete a company account

  //Check that a company is deletable, by checking if there are any active/ unpaid orders
  tblOrders.First ;
  while not tblOrders.eof do
  begin
    if tblOrders['CompanyID'] = pID  then  // If the Order falls under the company that want to be deleted
    begin
      if (tblOrders['Paid'] = false) and not (tblOrders['Status'] = 'Canceled') then // Checks that there are no outstanding payments for orders which were not cancelled
      begin
         ShowMessage('Unpaid order(s) found.'+#13+ 'Pay order or Cancel order to delete account') ;
         Result := false;   // Return a false if the deletio failed
         exit;
      end;

      if not (tblOrders['Status'] = 'Delivered') and not (tblOrders['Status'] = 'Canceled') then // Check for orders that prevents deletion
      begin
        ShowMessage('Account Deletion not Eligible'+#13+'Active/Unresolved order(s) found.'+#13+'Resolve/ Complete orders to delete account.')  ;
        Result := False ;
        exit;
      end;

    end;

    tblOrders.next;
  end;

  // Move orders to deletion account, this is done to still keep the order data, and still allow for an account deletetion
  qrySQL.SQL.Text := 'Update tblOrders SET CompanyID = 54 where CompanyID = '+ inttostr(pID);
  qrySQL.ExecSQL ;

  // Delete the company account
  qrySQL.SQL.Text := 'Delete from tblCompany where CompanyID = '+ inttostr(pID);
  qrySQL.ExecSQL ;

  Result := True; // Return a True if the deletion was successfull
end;

procedure TfrmVolitant_Express.edtSearchForItemChange(Sender: TObject);
var
  I: Integer;
begin
// Search and select an item when you search for it
  for I := 0 to (lstSelectItemManage.Count-1) do
  begin
    if Pos(Uppercase(edtSearchForItem.Text), Uppercase(lstSelectItemManage.Items[i])) > 0  then  // Check for an item matching what is entered in the edit
    begin
      lstSelectItemManage.ItemIndex := i ;  // Set the index
       lstSelectItemManageClick(lstSelectItemManage);   // Call the lst box click
      Break;
    end;
  end;

end;

procedure TfrmVolitant_Express.FormActivate(Sender: TObject);
var
  tFile : TextFile ;
  sLine, sKeep : string ;
  iPos : integer ;
  I, k: Integer;
  rKeep : real;
begin
// Form Acticvate
iCountryCount := 0 ;
sID := '';
// Set the admin company controll buttons
btnDeleteCompanyAdmin.Enabled := False;
chkSuspendAccount.Enabled := False;
 btnUpdateSuspension.Enabled := False;

// array population

    // Populate the arrays containing the countries info
    if not FileExists('Country_Coordinates.txt')  then
    begin
      ShowMessage('Country_Coordinates.txt was not found!  Create a new Country_Coordinates.txt file that does not have more than 245 countries and has the format of CountryCode#Latitude#Longitude#CountryName');
      Exit;
    end
    else
    begin
      AssignFile(tFile, 'Country_Coordinates.txt')  ;
      Reset(tFile);

      while not Eof(tFile) and (iCountryCount < 245)  do
      begin
        Inc(iCountryCount);
        Readln(tFile, sLine) ;
         //arrCountryCode
        iPos := Pos('#', Sline);
        arrCountryCode[iCountryCount] := Copy(sLine, 1, iPos-1 ) ;
        Delete(sLine, 1 , iPos);
         //arrLatitude
         iPos := Pos('#', Sline);
        arrlatitude[iCountryCount] := (StrToFloat(Copy(sLine, 1, iPos-1 )) * (pi/ 180)) ;
        Delete(sLine, 1 , iPos);
        //arrLongitude
         iPos := Pos('#', Sline);
        arrLongitude[iCountryCount] := (strToFloat(Copy(sLine, 1, iPos-1 )) * (pi/ 180)) ;
        Delete(sLine, 1 , iPos);
        //CountryName
        arrCountryName[iCountryCount] := sLine ;

      // ShowMessage(IntToStr(iCountryCount) );
      end;

      CloseFile(tFile) ;
    end;

    // Sort the country arrays alpabetically from A to Z
    for I := 1 to iCountryCount -1 do
      for k := I+1 to iCountryCount do
      begin
        if UpperCase(arrCountryName[k]) < UpperCase(arrCountryName[i])   then
        begin
          // arrCountryName
          sKeep := arrCountryName[I];
          arrCountryName[I] := arrCountryName[k] ;
          arrCountryName[k] := skeep;
          // arrCountryCode
           sKeep := arrCountryCode[I];
          arrCountryCode[I] := arrCountryCode[k] ;
          arrCountryCode[k] := skeep;
          // arrLongitude
          rKeep := arrLongitude[I];
          arrLongitude[I] := arrLongitude[k];
          arrLongitude[k] := rKeep;
          //arrLatitude
          rKeep := arrLatitude[i];
          arrLatitude[i] := arrLatitude[k];
          arrLatitude[k] := rKeep;

        end;
      end;

    // Load the countries into selection boxes
    cmbCountryBased.Clear ; // Clears any txt that may have been in the comboBox
    for I := 1 to iCountryCount do
    cmbCountryBased.Items.Add(arrCountryName[i]) ;

    // Special character array
      iSpecialCharacterCount := 0;
    
     if not FileExists('Special_Characters.txt')  then
      begin
        ShowMessage('Special_characters.txt not found. Create a new one with no more than 32 characters') ;
        Exit ;
      end
      else
      begin
        AssignFile(tFile, 'Special_Characters.txt');
        Reset(tFile) ;

        while not Eof(tFile) and (iSpecialCharacterCount < 32) do
        begin
           Inc(iSpecialCharacterCount); 

           Readln(tFile, arrSpecialCharacters[iSpecialCharacterCount] ) ;
        end;
       
        CloseFile(tFile) ;
      end;

  if bTimer = false then // Only set this on the first time the activation code runs
  begin

  // Run the plane animation
  imgPlaneAnimation.Stretch := True;
  imgPlaneAnimation.Picture.LoadFromFile('Program Media/airplane-side-view-travel-passenger-commercial-vector-15881171.jpg') ;
  imgPlaneAnimation.Left := 0 ;

  {       // This is code from my grade 10 PAT
    ProgressValue := 0;
  ProgressBarStartUp.Min := 0;
  ProgressBarStartUp.Max := 1000;
  ProgressBarStartUp.Position := ProgressValue;   }

  // Set the timers properties
  tFlightAnimation.Interval := 250; // 1000 milliseconds (1 second)
  tFlightAnimation.Enabled := True;
    //  Countdown := 5  ;

  bTimer := true ;
  end;

    

// Database Connection

  conDB.Connected := False ;
  conDB.LoginPrompt := False ;

  conDB.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Volitant_Express_db.mdb;Mode=ReadWrite;Persist Security Info=False' ;

  conDB.Open;


  // SQL Query connection

  qrySQL.Connection := conDB ;

  dsrSQL.DataSet := qrySQL ;

  dbgSQL_admin.DataSource := dsrSQL ;

  // Grid Query Connection

  qryGrid.Connection := conDB ;
  dsrGrid.DataSet := qryGrid;
  dbgGridDisplay.DataSource := dsrGrid ; // Link to the dbg grid

  // tblCompany    DO this for every table

  tblCompany.Connection := conDB ;
  tblCompany.TableName := 'tblCompany';
  tblCompany.Active := True;

  dsrCompany.DataSet := tblCompany ;

 // dbgtest.datasource := dsrCompany ;

 //tblOrders

  tblOrders.Connection := conDB ;
  tblOrders.TableName := 'tblOrders';
  tblOrders.Active := True;

  dsrOrders.DataSet := tblOrders ;

//  dbgtest.datasource := dsrOrders  ;

  // tblItems

  tblItems.Connection := conDB ;
  tblItems.TableName := 'tblItems';
  tblItems.Active := True;

  dsrItems.DataSet := tblItems ;

//  dbgtest.datasource := dsrItems  ;

  // tblPlanes

  tblPlanes.Connection := conDB ;
  tblPlanes.TableName := 'tblPlanes';
  tblPlanes.Active := True;

  dsrPlanes.DataSet := tblPlanes ;

//dbgtest.datasource := dsrPlanes  ;

end;

procedure TfrmVolitant_Express.FormCreate(Sender: TObject);
var
  tFile : textfile;
  sColor : string ;
begin
// Set up the tab sheets
{
tsRegister.TabVisible := False;
tsLogin.TabVisible := False;
tsIntroVideo.TabVisible := False;
tsGallery.TabVisible := False;
}
      {                              // Dont add the sum page to list, will cause errors due to activepage.tabvisible
  tsItemsAdmin.TabVisible := False;
  tsPlanesAdmin.TabVisible := False;
  tsOrdersAdmin.TabVisible := False;
  tsCompaniesAdmin.TabVisible := False;
  tsEmailsAdmin.TabVisible := False;
  tsCustomAdmin.TabVisible := False;
               }

  tsContact.TabVisible := False;
  tsLastInfo.TabVisible := False;
  tsRegConfirm.TabVisible := False;

  // Set sonme starting variablles
  bTimer := False;
  iImageCount := 0;

  // Set the programs color themes
    // Set the forms color
    if FileExists('Themes/formtheme.txt')  then  // Only load if the file exists else just leave as normal
    begin
      AssignFile(tFile, 'Themes/formtheme.txt');
      Reset(tFile);
      Readln(tFile, sColor);    // Read the color code from the txt file
      frmVolitant_Express.Color := StrToInt(sColor);  // Set the color of the form
      CloseFile(tFile);    // Close the file
    end;
    // Set the color of the welcome label
    if FileExists('Themes/welcome_label_theme.txt')  then  // Only load if the file exists else just leave as normal
    begin
      AssignFile(tFile, 'Themes/welcome_label_theme.txt');
      Reset(tFile);
      Readln(tFile, sColor);    // Read the color code from the txt file
      lblWelcome.font.Color := StrToInt(sColor);  // Set the color of the label
      CloseFile(tFile);    // Close the file
    end;
    // Set the color of the home label
    if FileExists('Themes/home_label_theme.txt')  then  // Only load if the file exists else just leave as normal
    begin
      AssignFile(tFile, 'Themes/home_label_theme.txt');
      Reset(tFile);
      Readln(tFile, sColor);    // Read the color code from the txt file
      lblWelcomeHome.font.Color := StrToInt(sColor);  // Set the color of the label
      CloseFile(tFile);    // Close the file
    end;
    // Set the color of the home group box
    if FileExists('Themes/home_grb_theme.txt')  then  // Only load if the file exists else just leave as normal
    begin
      AssignFile(tFile, 'Themes/home_grb_theme.txt');
      Reset(tFile);
      Readln(tFile, sColor);    // Read the color code from the txt file
      grbHome.Color := StrToInt(sColor);  // Set the color of the group box
      CloseFile(tFile);    // Close the file
    end;


end;

procedure TfrmVolitant_Express.imgDynamicOnclick;
var
  sString : string;
begin
// Onclick for the dynamic images. Display something positive stat wise about volitant express

  case RandomRange(1,6)  of      // When an image is clicked, a random message with stats wil be displayed 
  1: begin     // Count how many successfull orders has taken place
      qrySQL.SQL.Text := 'Select Count(*) as Result from tblOrders where status = "Delivered"';
      qrySQL.open;
       sString := (inttostr(qrySQL['Result']))  ;
       ShowMessage('Total successfull orders: '+sString) ;
    end;
    
  2: begin  // Count how many active planes the company have
       qrySQL.SQL.Text := 'Select Count(*) as Result from tblPlanes where Retired = NO';
      qrySQL.open;
       sString := (inttostr(qrySQL['Result']))  ;
       ShowMessage('Total Active Planes: ' + sString ) ; 
    end;
  3:     
    begin // Count how many items are currently shipped by Volitant Express
       qrySQL.SQL.Text := 'Select Count(*) as Result from tblItems where Retired = NO';
      qrySQL.open;
       sString := (inttostr(qrySQL['Result']))  ;
       ShowMessage('We currently transport '+ sString + ' different items') ;
    end;
  4:
    begin // Count how many companies are customers
         qrySQL.SQL.Text := 'Select Count(*) as Result from tblCompany';
      qrySQL.open;
       sString := (inttostr(qrySQL['Result']))  ;
       ShowMessage(sString +' companies trust us to transport their goods from locations around the world') ;
    end;
  5:
    begin  // Display the country with the most Companies as customers of Volitant Express
        qrySQL.SQL.Text := 'Select TOP 1 [Location Based] as Result from tblCompany Group By [Location Based] ORDER BY COUNT(*) DESC';
      qrySQL.open;
       sString := ((qrySQL['Result']))  ;
       ShowMessage('Most of our Customer Companies are based in: '+ sString ) ;
    end;
  end;

end;

procedure TfrmVolitant_Express.lstManagePlaneClick(Sender: TObject);
var
  iPlaneID : integer ;
  bFound : boolean ;
begin
// Load file info into the components
  // Validate that an item is selected
    if lstManagePlane.ItemIndex = -1 then
    begin
      ShowMessage('Select a valid plane');
      exit;
    end;
    // Get the ID
  iPlaneID  := StrToInt(Copy(lstManagePlane.Items[lstManagePlane.ItemIndex], 1, Pos('-',lstManagePlane.Items[lstManagePlane.ItemIndex])-1 ) ) ;
   // Get the matching record
   tblPlanes.First ;
   bFound := False;
   while not tblPlanes.Eof and (bFound = False) do
   begin
      if tblPlanes['PlaneID'] = iPlaneID then // If a matching record was found
      begin
        bFound := True;
        sedUpdateFuelRands.Value := Trunc(tblPlanes['FuelCost']) ; // Set the Rands
        sedUpdateFuelCents.Value := Round(Frac(tblPlanes['FuelCost'])* 100 ) ; // Set the cents
        chkRetirePlane.Checked := tblPlanes['Retired'] ; // If the plane is retired or not
        sedUpdatePlaneCount.Value := tblPlanes['Count'] ;
      end;
   tblPlanes.Next ;
   end;

end;

procedure TfrmVolitant_Express.lstSelectItemManageClick(Sender: TObject);
var
  sItemName : string;
  bFound : boolean;
begin
// Update the Update components
       // Ensure that item was selected to update
  if lstSelectItemManage.ItemIndex = -1 then
  begin
    ShowMessage('Select item that exists') ;
    exit ;
  end;
  // Item Name extraction
  sItemName := Copy(lstSelectItemManage.Items[lstSelectItemManage.ItemIndex], 1, POS(' -- ', lstSelectItemManage.Items[lstSelectItemManage.ItemIndex])-1)   ;
  redUpdateItem.Clear ;
  // Search the item to update
  bFound := False;
  tblItems.First ;
  while not tblItems.eof and (bFound = False) do
  begin
    if sItemName = tblItems['Item Name'] then
    begin
      bFound := True;
      iItemUpdateID :=tblItems.RecNo ; // Get the record of the item selected
      // Update the components for the update of the ITEM

      redUpdateItem.Lines.Add(tblItems['Note']);
      // Item retirement
      if tblItems['Retired'] = True then
      btnRetireItem.Caption := 'UnRetire Item'
      else
       btnRetireItem.Caption := 'Retire Item';

      chkChangeItemDangerous.Checked := tblItems['Dangerous'];    // Set the dangerous component

        // Calculate the cost
        sedUpdateItemRands.Value := Trunc(tblItems['T_Cost/kg']);
        sedUpdateItemCents.Value := Round(Frac(tblItems['T_Cost/kg'])*100);
    end;

    tblItems.Next ;
  end;

end;

procedure TfrmVolitant_Express.pgcAdminChange(Sender: TObject);
begin
// Change things on the tabpages when a change is made
redCompanyOut.Clear ;
end;

procedure TfrmVolitant_Express.sedEnterCompanyIDChange(Sender: TObject);
begin
// Set things right when a change is made ragarding the companies management
  btnDeleteCompanyAdmin.Enabled := False;
  chkSuspendAccount.Enabled := False;
  btnUpdateSuspension.Enabled := False;
  btnLoadCompany.Enabled := True;
end;

procedure TfrmVolitant_Express.tFlightAnimationTimer(Sender: TObject);
begin
 // Timer code
 // Change the image location
 imgPlaneAnimation.Left := imgPlaneAnimation.Left + 30;

 if imgPlaneAnimation.Left > 1100 then
 imgPlaneAnimation.Left := 0 ;
end;

function TfrmVolitant_Express.ValidateEmail(pEmail: string): Boolean;
var
  sEmail : string ; 
  I, iPointPos, iATcount : integer ;
  bPoint: boolean;
begin
// Function to validatate an email address
// Returns a true in the end if the email is valid
   sEmail := pEmail;
    // Checks that an email was entered
  if (sEmail = '') or (sEmail = ' ') then
  begin
    ShowMessage('Please enter an email address');
    Result := False;
    exit;
  end;
  // Checks that the email is in a certain range 
  if Length(sEmail) > 70  then
  begin
    ShowMessage('Email must be 70 characters or shorter') ;
      Result := False;
    Exit;
  end;

     // ensures that the email does not start with a dot
    if sEmail[1] = '.' then
    begin
      ShowMessage('Email may not start with a .');
        Result := False;
      exit; 
    end;
    
    // Checks that there are no spaces in the email
  if Pos(' ', sEmail) > 0  then
  begin
    ShowMessage('No spaces are allowed in the email');
      Result := False;
    exit; 
  end;
  
  iATcount := 0;
    // Check that the email contains valid characters
  for I := 1 to Length(sEmail)  do
    begin
      if not (sEmail[I] in ['A'..'Z', 'a'..'z', '@', '.', '0'..'9']) then
      begin
        ShowMessage('Invalid characters in email');
          Result := False;
        exit; 
      end;

      if sEmail[i] = '@' then
      Inc(iATcount)  ;
      
    end;

  // Checks that there is an @ in the email
  if not (iATcount  = 1) then
  begin
    ShowMessage('Email must have 1 @ only');
      Result := False;
    exit; 
  end;

  // Checks that there is a . after the @ in the email
  bPoint := False ;
  iPointPos := 0;
   for I := Length(sEmail)  Downto Pos('@', sEmail)  do
   begin
      if sEmail[i]= '.' then
      begin
        bPoint := True ;
        iPointPos := I ;
        Break;
      end;
      
   end;
     
   if bPoint = False then
   begin
     ShowMessage('Enter a valid domain after the @ (.)')  ;
       Result := False;
     Exit ;
   end
   else
   begin
      if ( (iPointPos = Length(sEmail) )) then // ensures that the last character is not a dot
      begin
        ShowMessage('Enter a valid domain after the @');
          Result := False;
        exit;
      end;
      // ensures that there is something after a dot 
      if not (sEmail[iPointPos+1] in ['A'..'Z', 'a'..'z']) then
      begin
          ShowMessage('Enter a valid domain after the @ ()');
            Result := False;
        exit;
      end;
      
      for I := 1 to Length(sEmail)-1  do
        begin
          if ((sEmail[I] = '.') and (sEmail[I+1] = '.')) then // Checks that there are not double dots in the email
          begin
            ShowMessage('No double dots allowed in email');
              Result := False;
            exit;
          end;
          // ensures that there is not a . directly agaist the @ in the email
          if ((sEmail[I] = '.') and (sEmail[I+1] = '@')) or ((sEmail[I] = '@') and (sEmail[I+1] = '.')) then
          begin
            ShowMessage('Enter a valid email. There must be things between the dot and the @');
              Result := False;
            exit; 
          end;
          
        end;
   end;
    Result := True;
end;

procedure TfrmVolitant_Express.WriteToFormTheme(pFileName: string;
  pColorValue: integer);
  var
    tFile : textfile;
begin
// Write to the Files containing the themes
  // Always rewrite the file as a new value will always be stored
  AssignFile(tFile, pFileName) ;
  Rewrite(tFile) ;

  Writeln(tFile, pColorValue) ;

  CloseFile(tFile) ;
end;

end.
// THE END OF THE FILE :)