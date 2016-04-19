using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Reset the message
        lblMessage.Text = "";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // Reset the message
        lblMessage.Text = "";
        if (Page.IsPostBack)
        {
            Page.Validate();
            if (Page.IsValid == true)
            {
                // Set the message to show successful submission.
                lblMessage.Text = "Successfully submitted valid form. The page will reload in 5 seconds.";

                // Clear Form Fields
                txtFirstName.Text = "";
                txtLastName.Text = "";
                txtEmail.Text = "";
                txtPassword.Text = "";
                txtPassword2.Text = "";
                txtPhone.Text = "";
                txtAge.Text = "";
                txtDate.Text = "";
                fileAvatar = new FileUpload();
                txtFilePath.Text = "";
            }
        }
    }

    protected void cValidAvatarFile_ServerValidate(object source, ServerValidateEventArgs args)
    {
        // Get filename
        string UploadFileName = fileAvatar.PostedFile.FileName;
        if (UploadFileName == "")
        {
            // No file was posted
        }
        else
        {
            // Pull the extension off the filename
            string Extension = UploadFileName.Substring(UploadFileName.LastIndexOf('.') + 1).ToLower();

            // Check for the following file extensions.
            if (Extension == "jpg" || Extension == "jpeg" || Extension == "png" || Extension == "ico")
            {
                args.IsValid = true; // The file is a valid extension.
            }
            else
            {
                args.IsValid = false; // The file is an invalid extension.
            }
        }
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        // Clear Message
        lblMessage.Text = "";

        // Clear Form Fields
        txtFirstName.Text = "";
        txtLastName.Text = "";
        txtEmail.Text = "";
        txtPassword.Text = "";
        txtPassword2.Text = "";
        txtPhone.Text = "";
        txtAge.Text = "";
        txtDate.Text = "";
        fileAvatar = new FileUpload();
        txtFilePath.Text = "";

    }
}