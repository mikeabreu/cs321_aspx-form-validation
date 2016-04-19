<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Form.aspx.cs" Inherits="Form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Form Validation Examples</title>
    <!--Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--materialize.css-->
    <link type="text/css" rel="stylesheet" href="materialize/css/materialize.min.css"  media="screen,projection"/>

    <style>
        #wrapper {
            margin: 50px auto;
        }
        #validSummary {
            padding: 20px 0;
        }
        #msgDiv > div {
            padding: 20px 10px !important;
        }
    </style>

    <script type="text/javascript">
        // Validate the file upload on client side.
        function ValidateFileUpload(Source, args) {
            var $avatarFile = $j('#fileAvatar');
            var $submitButton = $j("#SubmitButton > i");
            var $fileMsg = $j("#cValidFileAvatar");
            var $filePathInput = $j("#txtFilePath");
            var FileUploadPath = $avatarFile.val();
            //console.log("FileUploadPath: " + FileUploadPath); // Debugging
            if (FileUploadPath == '') {
                //console.log("No file selected"); // Debugging
            } else {
                var Extension = FileUploadPath.substring(FileUploadPath.lastIndexOf('.') + 1).toLowerCase();
                //console.log("Extension: " + Extension); // Debugging
                if (Extension == "jpg" || Extension == "jpeg" || Extension == "png" || Extension == "ico") {
                    args.IsValid = true;
                    //console.log("Valid file type"); // Debugging
                    $submitButton.removeClass('disabled');
                    $filePathInput.removeClass('invalid');
                    $filePathInput.addClass('valid');
                } else {
                    args.IsValid = false;
                    $fileMsg.attr('style', '');
                    $submitButton.addClass('disabled');
                    $filePathInput.removeClass('valid');
                    $filePathInput.addClass('invalid');
                    //console.log("Invalid file type"); // Debugging
                }
            }
        }
    </script>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>

    <div id="wrapper" class="container">

        <form id="form1" runat="server" class="card-panel" action="Form.aspx" method="post">
            <div class="row">
                <div class="col s12">
                    <h2 class="center-align flow-text">Form Validation Example</h2>
                    <p class="left-align">The required fields are marked with an asterisk (*).</p>
                </div>
            </div>

            <!-- Message Summary -->
            <% if (lblMessage.Text != "")
                { %>
                <div id="msgDiv" class="row">
                    <div class="col s12 green card-panel">
                        <asp:Label ID="lblMessage" runat="server" Text="" Display="Dynamic"></asp:Label>
                    </div>
                </div>
                <meta http-equiv="refresh" content="5"/>
            <% }; %>

            <!-- Validation Summary -->
            <div id="vldSumDiv" class="row">
                <div class="col s12 red card-panel">
                    <asp:ValidationSummary ID="validSummary" runat="server" HeaderText="The following errors occurred:" ValidationGroup="form1" />
                </div>
            </div>

            <!-- Names -->
            <div class="row">
                <!-- First Name -->
                <div class="input-field col s6">
                    <asp:TextBox ID="txtFirstName" runat="server" Length="30" CssClass="validate"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqFirstName" CssClass="red-text" runat="server" ErrorMessage="First name can't be blank." ControlToValidate="txtFirstName" Display="Dynamic" ValidationGroup="form1"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regexFirstName" CssClass="red-text" runat="server" ErrorMessage="Enter a valid string" ValidationExpression="[A-Za-z]+(['][A-Za-z]+)*" ControlToValidate="txtFirstName" Display="Dynamic" ValidationGroup="form1"></asp:RegularExpressionValidator>
                    <label for="first_name">* First Name</label>
                </div>
                <!-- Last Name -->
                <div class="input-field col s6">
                    <asp:TextBox ID="txtLastName" runat="server" Length="30" CssClass="validate"></asp:TextBox>
                    <label for="last_name">* Last Name</label>
                    <asp:RequiredFieldValidator ID="reqLastName" CssClass="red-text" runat="server" ErrorMessage="Last name can't be blank." ControlToValidate="txtLastName" Display="Dynamic" ValidationGroup="form1"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regexLastName" CssClass="red-text" runat="server" ErrorMessage="Enter a valid string" ValidationExpression="[A-Za-z]+(['][A-Za-z]+)*" ControlToValidate="txtLastName" Display="Dynamic" ValidationGroup="form1"></asp:RegularExpressionValidator>
                </div>
            </div>
            <!-- Email Address -->
            <div class="row">
                <div class="input-field col s12">
                    <asp:TextBox ID="txtEmail" runat="server" type="email" CssClass="validate" Length="75"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqEmail" CssClass="red-text" runat="server" ErrorMessage="Email address can't be blank." ControlToValidate="txtEmail" Display="Dynamic" ValidationGroup="form1"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regexEmail" CssClass="red-text" runat="server" ErrorMessage="Enter a valid email address" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ValidationGroup="form1"></asp:RegularExpressionValidator>
                    <label for="txtEmail">* Email</label>
                </div>
            </div>
            <!-- Password -->
            <div class="row">
                <div class="input-field col s12">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="validate" Length="32" type="password"></asp:TextBox>
                    <label for="password">* Password</label>
                    <asp:RequiredFieldValidator ID="reqPassword" CssClass="red-text" runat="server" ErrorMessage="Password can't be blank." ControlToValidate="txtPassword" Display="Dynamic" ValidationGroup="form1"></asp:RequiredFieldValidator>
                </div>
            </div>
            <!-- Confirm Password -->
            <div class="row">
                <div class="input-field col s12">
                    <asp:TextBox ID="txtPassword2" runat="server" CssClass="validate" Length="32" type="password"></asp:TextBox>
                    <label for="password2">* Confirm Password</label>
                    <asp:RequiredFieldValidator ID="reqPassword2" CssClass="red-text" runat="server" ErrorMessage="Confirmation password can't be blank." ControlToValidate="txtPassword2" Display="Dynamic" ValidationGroup="form1"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cmpPasswords" CssClass="red-text" runat="server" ErrorMessage="Confirmation password doesn't match original password." Display="Dynamic" ControlToCompare="txtPassword" ControlToValidate="txtPassword2" ValidationGroup="form1"></asp:CompareValidator>
                </div>
            </div>
            <!-- Phone / Age -->
            <div class="row">
                <!-- Phone Number -->
                <div class="input-field col s6">
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="validate" type="text" Length="14" MaxLength="14"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regexPhone" CssClass="red-text" runat="server" ErrorMessage="Enter a valid phone number (###) ###-####" ControlToValidate="txtPhone" ValidationExpression="[(][0-9]{3}[)]\s[0-9]{3}[-][0-9]{4}"></asp:RegularExpressionValidator>
                    <label for="txtPhone">Cell Phone Number</label>
                </div>
                <!-- Age -->
                <div class="input-field col s6">
                    <asp:TextBox ID="txtAge" runat="server" CssClass="validate" type="number" Length="3"></asp:TextBox>
                    <asp:RangeValidator ID="rngAge" CssClass="red-text" runat="server" ErrorMessage="Enter an age between 1 and 120." ControlToValidate="txtAge" MaximumValue="120" MinimumValue="1" Type="Integer" ValidationGroup="form1"></asp:RangeValidator>
                    <label for="txtAge">Age</label>
                </div>
            </div>
            <!-- Date -->
            <div class="row">
                <div class="input-field col s12">
                    <asp:TextBox ID="txtDate" runat="server" CssClass="datepicker" type="date" placeholder="Pick a Date"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regexDate" CssClass="red-text" runat="server" ErrorMessage="Select a valid date from the datepicker." ControlToValidate="txtDate" Display="Dynamic" ValidationExpression="[0-9][0-9]?\s[A-Za-z]+[,]+\s[0-9]{4}" ValidationGroup="form1"></asp:RegularExpressionValidator>
                    <label class="active" for="txtDate">Date</label>
                </div>
            </div>
            <!-- Avatar Picture -->
            <div class="row">
                <div class="file-field input-field col s12">
                    <p>Avatar File</p>
                    <div class="btn">
                        <span>File</span>
                        <asp:FileUpload ID="fileAvatar" runat="server" CssClass="" />
                    </div>
                    <div class="file-path-wrapper">
                        <asp:TextBox ID="txtFilePath" runat="server" CssClass="file-path" Type="text"></asp:TextBox>
                    </div>
                    <asp:CustomValidator ID="cValidFileAvatar" CssClass="red-text" runat="server" ErrorMessage="Only files of type .jpg, .jpeg, .png, and .gif are acceptable." ClientValidationFunction="ValidateFileUpload" ControlToValidate="fileAvatar" OnServerValidate="cValidAvatarFile_ServerValidate" Display="Dynamic" ValidationGroup="form1"></asp:CustomValidator>
                </div>
            </div>
            <!-- Buttons -->
            <div class="row">
                <!-- Submit button -->
                <div id="SubmitButton" class="input-field col m1 s5">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn waves-effect waves-light" type="submit" name="action" OnClick="btnSubmit_Click" ValidationGroup="form1" />
                </div>
                <!-- Clear button -->
                <div id="ClearButton" class="input-field col s5 offset-s1 m1 offset-m1">
                    <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn waves-effect waves-light red" type="button" name="clear" OnClick="btnClear_Click" />
                </div>
            </div>
        </form>
    </div>

    <!--jQuery-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <!-- materialize.js -->
    <script type="text/javascript" src="materialize/js/materialize.min.js"></script>

    <script type="text/javascript">
        $j = jQuery.noConflict();
        $j(document).ready(function () {
            // Initialize character count marker
            $j('input#input_text, textarea#textarea1').characterCounter();

            // Initialize datepicker
            $j('.datepicker').pickadate({
                selectMonths: true,
                selectYears: 15
            });

            // Check if valid summary is being displayed
            var $vldSumDiv = $j("#vldSumDiv");
            var $vldSum = $j("#validSummary");
            // If valid summary isn't being shown, hide the div.
            if ($vldSum.attr('style') == 'display:none;') {
                $vldSumDiv.css('display', 'none');
            } else {
                $vldSumDiv.css('display', 'block');
            }
            // Check for the form being submitted, update valid summary div
            $submit = $j("#btnSubmit");
            $submit.click(function () {
                if ($vldSum.attr('style') == 'display:none;') {
                    $vldSumDiv.css('display', 'none');
                } else {
                    $vldSumDiv.css('display', 'block');
                }
            });

            // Format the cell phone input
            $phoneInput = $j("#txtPhone");
            $phoneInput.keyup(function () {
                var curchr = this.value.length;
                var curval = $j(this).val();
                if (curchr == 3) {
                    $phoneInput.val("(" + curval + ")" + " ");
                } else if (curchr == 9) {
                    $phoneInput.val(curval + "-");
                }
            });
        });
    </script>

</body>
</html>
