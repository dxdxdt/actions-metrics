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
Updated: 2026-03-08T11:15:25.028658+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.966 |  |
| ap-east-1 | 0.730 |  |
| ap-east-2 | 0.676 |  |
| ap-northeast-1 | 0.552 |  |
| ap-northeast-2 | 0.661 |  |
| ap-northeast-3 | 0.576 |  |
| ap-south-1 | 0.907 |  |
| ap-south-2 | 0.966 |  |
| ap-southeast-1 | 0.805 |  |
| ap-southeast-2 | 0.718 |  |
| ap-southeast-3 | 0.859 |  |
| ap-southeast-4 | 0.760 |  |
| ap-southeast-5 | 0.827 |  |
| ap-southeast-6 | 0.750 |  |
| ap-southeast-7 | 0.906 |  |
| ca-central-1 | 0.145 | 16 |
| ca-west-1 | 0.222 |  |
| eu-central-1 | 0.471 |  |
| eu-central-2 | 0.487 |  |
| eu-north-1 | 0.512 |  |
| eu-south-1 | 0.499 |  |
| eu-south-2 | 0.497 |  |
| eu-west-1 | 0.395 |  |
| eu-west-2 | 0.424 |  |
| eu-west-3 | 0.444 |  |
| il-central-1 | 0.657 |  |
| me-central-1 | 0.848 |  |
| me-south-1 | 0.811 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.570 |  |
| us-east-1 | 0.121 | 4240 |
| us-east-2 | 0.107 | 1408 |
| us-gov-east-1 | 0.105 | 1543 |
| us-gov-west-1 | 0.209 | 174 |
| us-west-1 | 0.208 | 3195 |
| us-west-2 | 0.211 | 144 |

