<?php
    class DbOperation {
        private $con;

        function __construct() {
            require_once dirname(__FILE__).'/DbConnect.php';
            $db = new DbConnect();
            $this->con = $db->connect();
        }

        public function setDataRequest($name_request, $deposit, $service, $executor, $priority, $date_creation, $date_begine, $author) {
            $stmt = $this->con->prepare("INSERT INTO requests (id_request, name_request, deposit, service, executor, status, priority, date_creation, date_begine, date_end, author) VALUES (NULL, ?, ?, ?, ?, '1', ?, ?, ?, 'Не определено', ?);");
            $stmt->bind_param("siiiisss", $name_request, $deposit, $service, $executor, $priority, $date_creation, $date_begine, $author);
            if($stmt->execute()) {
                return 1;
            } else {
                $error = $this->con->errno . ' ' . $this->con->error;
                return $error;
            }
        }
        
        public function updateDataRequest($id_request, $name_request, $deposit, $service, $executor, $priority, $date_begine) {
            return $this->con->query("UPDATE requests SET name_request = '$name_request', deposit = '$deposit', service = '$service', executor = '$executor', priority = '$priority', date_begine = '$date_begine' WHERE id_request = '$id_request'");
        }
        
        public function deleteRequest($id_request) {
            return $this->con->query("DELETE FROM requests WHERE id_request = '$id_request'");
        }
        
       public function getDataRequests() {
            return $this->con->query("SELECT * FROM requests JOIN deposits ON deposit = id_deposit JOIN services ON service = id_service JOIN users ON executor = id JOIN organizations ON organization = id_organization JOIN statuses ON status = id_status JOIN priorities ON priority = id_priority");
        }
        
        public function getDataExecutor(){
            return $this->con->query("SELECT id, user_name, name_role FROM users JOIN roles ON role = id_role");
        }
        
        public function getDataDeposit(){
            return $this->con->query("SELECT name_deposit FROM deposits");
        }

        public function getDataService(){
            return $this->con->query("SELECT name_service FROM services");
        }

        public function getDataPriority(){
            return $this->con->query("SELECT name_priority FROM priorities");
        }
        
        public function userLogin($login, $password) {
            $stmt = $this->con->prepare("SELECT id FROM users WHERE login = ? AND password = ?");
            $stmt->bind_param("ss", $login, $password);
            $stmt->execute();
            $stmt->store_result();
            return $stmt->num_rows > 0;
        }
        
        public function getUserByLogin($login){
        $stmt = $this->con->prepare("SELECT * FROM users JOIN organizations ON organization = id_organization JOIN roles ON role = id_role WHERE login = ?");
        $stmt->bind_param("s", $login);
        $stmt->execute();
        $stmt->bind_result($id, $login, $password, $user_name, $organization, $role, $id_organization, $name_organization, $id_role, $name_role);
        $rows = [];
        while ($stmt->fetch()) {
            return $rows[] = [
                'id' => $id,
                'login' => $login,
                'password' => $password,
                'user_name' => $user_name,
                'organization' => $organization,
                'role' => $role,
                'id_organization' => $id_organization,
                'name_organization' => $name_organization,
                'id_role' => $id_role,
                'name_role' => $name_role,
            ];
        }
    }
}