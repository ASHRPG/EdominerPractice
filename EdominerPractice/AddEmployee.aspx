<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="AddEmployee.aspx.vb" Inherits="EdominerPractice.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container mt-4">
            <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
                <h3 class="mb-0">Add New Employee</h3>
                <asp:Button ID="btnReturnBacktoEmpList" runat="server" Text="Return to Employee List"
                    CssClass="btn btn-outline-primary" OnClick="btnReturnBacktoEmpList_Click" />
            </div>
            <div class="row">
                <asp:label ID="lblError" runat="server" class="text-danger"></asp:label>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <asp:Label ID="lblEmployeeName" runat="server" Text="Employee Name" cssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtEmployeeName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-6 mb-3">
                    <asp:Label ID="lblDepartment" runat="server" Text="Department" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtDepartment" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-6 mb-3">
                    <asp:Label ID="lblDesignation" runat="server" Text="Designation" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtDesignation" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-6 mb-3">
                    <asp:Label ID="lblSalary" runat="server" Text="Salary" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtSalary" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-6 mb-3">
                    <asp:Label ID="lblJoinDate" runat="server" Text="Join Date" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtJoinDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-6 mb-3">
                    <asp:Label ID="lblEmail" runat="server" Text="Email" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-6 mb-3">
                    <asp:Label ID="lblPhone" runat="server" Text="Phone" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-6 mb-3">
                    <asp:Label ID="lblAddress" runat="server" Text="Address" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
                </div>

            </div>
            <asp:Button ID="btnAddEmployee" runat="server" Text="Add Employee" CssClass="btn btn-primary" OnClick="btnAddEmployee_Click" />
        </div>
</asp:Content>
