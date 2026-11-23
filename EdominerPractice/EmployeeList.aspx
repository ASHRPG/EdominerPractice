<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="EmployeeList.aspx.vb" Inherits="EdominerPractice.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="lblError" runat="server"></asp:Label>
    <div class="d-flex justify-content-end mb-3">
        <asp:LinkButton ID="AddNewEmployee" OnClick="AddNewEmployee_Click" runat="server" CssClass="btn btn-success mb-3">Add Employee</asp:LinkButton>
    </div>
    <asp:GridView ID="gvEmployees" runat="server" CssClass="table table-bordered table-striped table-hover" AutoGenerateColumns="true" DataKeyNames="EmployeeID" OnRowCommand="gvEmployees_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="Action Button">
                <ItemTemplate>
                    <asp:LinkButton ID="btnDetails"
                        runat="server"
                        Text="View Details"
                        CssClass="btn btn-primary btn-sm"
                        CommandName="ViewDetails"
                        CommandArgument='<%# Eval("EmployeeID") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Action Button">
                <ItemTemplate>
                    <asp:LinkButton
                        ID="btnEdit"
                        runat="server"
                        Text="Edit"
                        CssClass="btn btn-warning btn-sm"
                        CommandName="EditDetails"
                        CommandArgument='<%# Eval("EmployeeID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Action Button">
                <ItemTemplate>
                    <asp:LinkButton
                        ID="btnDelete"
                        runat="server"
                        Text="Delete"
                        CssClass="btn btn-danger btn-sm"
                        CommandName="DeleteDetails" OnClientClick="return confirm('Are you sure want to delete this employee?');"
                        CommandArgument='<%# Eval("EmployeeID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <%-- <asp:Panel ID="pnlEmployeeDetails"
        runat="server"
        Visible="False"
        CssClass="border rounded p-3 mt-3">

        <h4>Employee Details</h4>

        <p>
            Name:
       
            <asp:Label ID="lblEmployeeName"
                runat="server" />
        </p>

        <p>
            Department:
       
            <asp:Label ID="lblDepartment"
                runat="server" />
        </p>

        <asp:Button ID="btnClose"
            runat="server"
            Text="Close"
            CssClass="btn btn-secondary" />

    </asp:Panel>--%>
<%--<asp:Button ID="btnOpenModal" runat="server" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#employeemodal" Text="Open Modal" OnClick="btnOpenModal_Click"></asp:Button>--%>

    <%-- Modal Window --%>

<div class="modal fade" id="employeemodal" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    Employee Details
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <asp:Label ID="lblEmployeeName" runat="server" Text="Name:" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtEmployeeName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mb-3">
                        <asp:Label ID="lblDepartment" runat="server" Text="Department:" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtDepartment" runat="server" CssClass="form-control"></asp:TextBox>

                    </div>
                    <div class="col-md-6 mb-3">
                        <asp:Label ID="lblDesignation" runat="server" Text="Designation:" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtDesignation" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="col-md-6 mb-3">
                        <asp:Label ID="lblSalary" runat="server" Text="Salary:" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtSalary" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="col-md-6 mb-3">
                        <asp:Label ID="lblJoinDate" runat="server" Text="Join Date:" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtJoinDate" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mb-3">
                        <asp:Label ID="lblEmail" runat="server" Text="Email:" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="col-md-6 mb-3">
                        <asp:Label ID="lblPhone" runat="server" Text="Phone:" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="col-md-6 mb-3">
                        <asp:Label ID="lblAddress" runat="server" Text="Address:" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                
            </div>
            <div class="modal-footer">
                <asp:HiddenField ID="hfEmployeeID" runat="server" />

                <asp:Button ID="btnSaveChanges"
                    runat="server"
                    Text="Save Changes"
                    CssClass="btn btn-success"
                    Visible="False" OnClick="btnSaveChanges_Click" />
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>

</div>
</asp:Content>
