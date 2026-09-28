#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import torch
import torchvision.transforms as transforms
import matplotlib.pyplot as plt
import numpy as np
from torch.utils.data import Dataset
import pandas as pd
from pathlib import Path
import cv2

current_dir = Path(__file__).parent
transform = transforms.Compose([transforms.ToTensor()])

batch_size = 4

class DatasetInterface(Dataset):
    def __init__(self, csv_path: str):
        self.data = pd.read_csv(csv_path)
        self.class_map = {
            "Andrena fulva": 0,
            "Panurgus banksianus": 1,
            "Lasioglossum punctatissimum": 2
        }
        self.img_dim = (520, 520)

    def __len__(self):
        return len(self.data)

    def __getitem__(self, idx: int):
        row = self.data.iloc[idx]
        img = cv2.imread(f"{current_dir}/Insects/{row.iloc[-1]}")
        img = cv2.resize(img, self.img_dim)
        class_id = self.class_map[row.iloc[1]]
        img_tensor = torch.from_numpy(img)
        img_tensor = img_tensor.permute(2, 0, 1)
        class_id = torch.tensor([class_id])
        return img_tensor, class_id

if __name__ == "__main__":
    # Set up the dataset.
    dataset = DatasetInterface(csv_path=f'{current_dir}/insects.csv')



    # Set up the dataset.
    trainloader = torch.utils.data.DataLoader(dataset,
                                            batch_size=batch_size,
                                            shuffle=True,
                                            num_workers=2)

    # get some images
    dataiter = iter(trainloader)
    images, labels = next(dataiter)


    for i in range(5): #Run through 5 batches
        images, labels = next(dataiter)
        for image, label in zip(images,labels): # Run through all samples in a batch
            plt.figure()
            plt.imshow(np.transpose(image.numpy(), (1, 2, 0)))
            plt.title(label)
            plt.show()
