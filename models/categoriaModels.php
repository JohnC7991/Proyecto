En model se trae siempre lo de DB

<?php

    class Categoria{
        private $id;
        private $nombre;

        private $db;

        public function __construct()
        {
            $this->db = Database::connect();
        }

        function getId(){
            return $this->id;
        }

        func_getNombre(){
            return $this->nombre;
        }
        func_setId($id){
            $this->id = $id;
        }
        function setNombre($nombre){
            $this->nombre->$nombre;
        }

    }

