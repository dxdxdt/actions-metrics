# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-08-11T21:37:41.945630+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.970 |  |
| ap-east-1 | 0.730 |  |
| ap-east-2 | 0.673 |  |
| ap-northeast-1 | 0.542 |  |
| ap-northeast-2 | 0.655 |  |
| ap-northeast-3 | 0.566 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.813 |  |
| ap-southeast-2 | 0.703 |  |
| ap-southeast-3 | 0.868 |  |
| ap-southeast-4 | 0.747 |  |
| ap-southeast-5 | 0.831 |  |
| ap-southeast-6 | 0.736 |  |
| ap-southeast-7 | 0.913 |  |
| ca-central-1 | 0.208 | 18 |
| ca-west-1 | 0.267 |  |
| eu-central-1 | 0.476 |  |
| eu-central-2 | 0.502 |  |
| eu-north-1 | 0.550 |  |
| eu-south-1 | 0.513 |  |
| eu-south-2 | 0.513 |  |
| eu-west-1 | 0.401 |  |
| eu-west-2 | 0.438 |  |
| eu-west-3 | 0.453 |  |
| il-central-1 | 0.634 |  |
| me-central-1 | 0.885 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.582 |  |
| us-east-1 | 0.142 | 4976 |
| us-east-2 | 0.180 | 1679 |
| us-gov-east-1 | 0.199 | 1822 |
| us-gov-west-1 | 0.229 | 218 |
| us-west-1 | 0.182 | 3926 |
| us-west-2 | 0.229 | 176 |

