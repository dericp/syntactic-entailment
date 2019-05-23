{
  "dataset_reader": {
    "type": "se-bert-snli",
    "pretrained_bert_model_file": "pretrained-models/mt-dnn-base",
    "token_indexers": {
      "tokens": {
        "type": "single_id"
      }
    },
    "tokenizer": {
      "word_splitter": {
        "type": "spacy",
        "pos_tags": true
      }
    }
  },
  "train_data_path": "multinli_1.0/multinli_1.0_train.jsonl",
  "validation_data_path": "multinli_1.0/multinli_1.0_dev_mismatched.jsonl",
  "model": {
    "type": "bert-lf",
    "parser_model_path": "pretrained-models/biaffine-dependency-parser-ptb-2018.08.23/biaffine-dependency-parser-ptb-2018.08.23.tar.gz",
    "parser_hidden_size": 800,
    "parser_cuda_device": 0,
    "freeze_parser": true,
    "pretrained_bert_model_file": "pretrained-models/mt-dnn-base",
    "num_labels": 3
  },
  "iterator": {
    "type": "basic",
    "batch_size": 32
  },
  "trainer": {
    "num_epochs": 5,
    "cuda_device": 0,
    "validation_metric": "+accuracy",
    "grad_clipping": 1,
    "optimizer": {
      "type": "bert_adamax",
      "lr": 0.00005,
      "warmup": 0.1,
      "t_total": 62000,
      "schedule": "warmup_linear"
    }
  },
  "vocabulary": {
    "type": "se-vocabulary",
    "parser_vocab": "pretrained-models/biaffine-dependency-parser-ptb-2018.08.23/vocabulary/tokens.txt",
    "pos_vocab": "pretrained-models/biaffine-dependency-parser-ptb-2018.08.23/vocabulary/pos.txt"
  }
}
