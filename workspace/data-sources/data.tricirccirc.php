<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcetricirccirc extends SectionDatasource {

		public $dsParamROOTELEMENT = 'tricirccirc';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamPARAMOUTPUT = array(
				'system:id'
		);
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		

		public $dsParamINCLUDEDELEMENTS = array(
				'tricirccirc-title',
				'tricirccirc-description',
				'tricirccirc-video-link',
				'tricirccirc-collaborators: collaborator-name',
				'tricirccirc-collaborators: collaborator-link',
				'tricirccirc-collaborators: collaborator-image'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about() {
			return array(
				'name' => 'TriCircCirc',
				'author' => array(
					'name' => 'Wynand Kok',
					'website' => 'http://andanonymous.com',
					'email' => 'wynand.kok@live.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-06-11T10:03:33+00:00'
			);
		}

		public function getSource() {
			return '1';
		}

		public function allowEditorToParse() {
			return true;
		}

		public function execute(array &$param_pool = null) {
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				$result = parent::execute($param_pool);
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			return $result;
		}

	}
