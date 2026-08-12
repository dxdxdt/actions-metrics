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
Updated: 2026-08-12T11:41:11.910740+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.910 |  |
| ap-east-1 | 0.774 |  |
| ap-east-2 | 0.725 |  |
| ap-northeast-1 | 0.599 |  |
| ap-northeast-2 | 0.708 |  |
| ap-northeast-3 | 0.619 |  |
| ap-south-1 | 0.849 |  |
| ap-south-2 | 0.920 |  |
| ap-southeast-1 | 0.848 |  |
| ap-southeast-2 | 0.765 |  |
| ap-southeast-3 | 0.912 |  |
| ap-southeast-4 | 0.818 |  |
| ap-southeast-5 | 0.871 |  |
| ap-southeast-6 | 0.821 |  |
| ap-southeast-7 | 0.949 |  |
| ca-central-1 | 0.152 | 18 |
| ca-west-1 | 0.267 |  |
| eu-central-1 | 0.423 |  |
| eu-central-2 | 0.441 |  |
| eu-north-1 | 0.498 |  |
| eu-south-1 | 0.448 |  |
| eu-south-2 | 0.458 |  |
| eu-west-1 | 0.346 |  |
| eu-west-2 | 0.382 |  |
| eu-west-3 | 0.403 |  |
| il-central-1 | 0.579 |  |
| me-central-1 | 0.822 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.527 |  |
| us-east-1 | 0.088 | 4978 |
| us-east-2 | 0.124 | 1679 |
| us-gov-east-1 | 0.165 | 1822 |
| us-gov-west-1 | 0.270 | 220 |
| us-west-1 | 0.233 | 3930 |
| us-west-2 | 0.272 | 176 |

