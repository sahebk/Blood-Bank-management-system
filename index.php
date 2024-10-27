<?php
 
   if($_SERVER["REQUEST_METHOD"]=="POST"){
    

 $donor_name=$_POST["d_name"];
 $gender=$_POST["d_gender"];
 $dob=$_POST["d_dob"];
 $blood_type=$_POST["d_bloodtype"];
 $phn_no=$_POST["d_phno"];
 $address=$_POST["d_address"];

 


 //connecting database
 
$conn= new mysqli('localhost','root','','blooddonation1');
if($conn->connect_error){
      echo"Connection Failed";
}
else{
    $stmt=$conn->prepare("insert into donor(Donor_Name,Donor_Gender,Donor_Date_of_Birth,Donor_Blood_type,Donor_Phone_No,Donor_Address) 
                        values(?,?,?,?,?,?)");
      $stmt->bind_param("ssssis",$donor_name,$gender,$dob,$blood_type,$phn_no,$address);
      $stmt->execute();
      echo"Registered Successfully";
      $stmt->close();
      $conn->close();

        

}
 }
 
 


 
?>