<?php
   if($_SERVER["REQUEST_METHOD"]=="POST"){
 $recip_name=$_POST["r_name"];
 $recip_gender=$_POST["r_gender"];
 $recip_dob=$_POST["r_dob"];
 $recip_blood_type=$_POST["r_bloodtype"];
 $recip_phn_no=$_POST["r_phno"];
 $recip_email= $_POST['r_email'];
 $recip_address=$_POST["r_address"];
 //connecting database
$conn= new mysqli('localhost','root','','blooddonation1');
if($conn->connect_error){
      echo"Connection Failed";
}
else{
    $stmt=$conn->prepare("insert into recepient(Recepient_name,Recip_Gender,Recip_Date_of_Birth,Recip_Blood_type,Recip_PhoneNo,Recip_Email,Recip_Address) 
                        values(?,?,?,?,?,?,?)");
      $stmt->bind_param("ssssiss",$recip_name,$recip_gender,
                                             $recip_dob,$recip_blood_type,$recip_phn_no,$recip_email,$recip_address);
        $stmt->execute();
        echo"Registered Successfully";
        $stmt->close();
        $conn->close();
}
 }
?>
