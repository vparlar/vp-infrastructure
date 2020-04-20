resource "azurerm_virtual_machine" "vm1" {
  name = "${var.vm1_computername}"
  location = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  network_interface_ids = ["${azurerm_network_interface.nic1.id}"]
  vm_size = "${var.vm_size}"
  storage_image_reference {
    publisher = "${var.publisher}"
    offer = "${var.offer}"
    sku = "${var.sku}"
    version = "${var.os_version}"
}
  storage_os_disk {
    name = "${var.vm1_computername}"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
}
os_profile {
  computer_name = "${var.vm3_computername}"
  admin_username = "${var.admin_username}"
}
os_profile_linux_config {
  disable_password_authentication = true
  ssh_keys {
    path = "/home/centos/.ssh/authorized_keys"
    key_data = "${file(var.ssh_pub_key)}"
  }
}
  tags {
    environment = "${var.environment}"
  }
}


resource "azurerm_virtual_machine" "vm2" {
  name = "${var.vm2_computername}"
  location = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  network_interface_ids = ["${azurerm_network_interface.nic2.id}"]
  vm_size = "${var.vm_size}"
  storage_image_reference {
  publisher = "${var.publisher}"
  offer = "${var.offer}"
  sku = "${var.sku}"
  version = "${var.os_version}"
}
storage_os_disk {
  name = "${var.vm2_computername}"
  caching = "ReadWrite"
  create_option = "FromImage"
  managed_disk_type = "Standard_LRS"
}
os_profile {
  computer_name = "${var.vm2_computername}"
  admin_username = "${var.admin_username}"
}
os_profile_linux_config {
  disable_password_authentication = true
  ssh_keys {
    path = "/home/centos/.ssh/authorized_keys"
    key_data = "${file(var.ssh_pub_key)}"
  }
}
tags {
    environment = "${var.environment}"
  }
}

resource "azurerm_virtual_machine" "vm3" {
  name = "${var.vm3_computername}"
  location = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  network_interface_ids = ["${azurerm_network_interface.nic3.id}"]
  vm_size = "${var.vm_size}"
  storage_image_reference {
  publisher = "${var.publisher}"
  offer = "${var.offer}"
  sku = "${var.sku}"
  version = "${var.os_version}"
}
storage_os_disk {
  name = "${var.vm3_computername}"
  caching = "ReadWrite"
  create_option = "FromImage"
  managed_disk_type = "Standard_LRS"
}
os_profile {
  computer_name = "${var.vm3_computername}"
  admin_username = "${var.admin_username}"
}
os_profile_linux_config {
  disable_password_authentication = true
  ssh_keys {
    path = "/home/centos/.ssh/authorized_keys"
    key_data = "${file(var.ssh_pub_key)}"
  }
}
tags {
    environment = "${var.environment}"
  }
}
