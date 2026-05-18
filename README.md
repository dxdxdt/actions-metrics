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
Updated: 2026-05-18T06:49:05.325791+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.042 |  |
| ap-east-1 | 0.668 |  |
| ap-east-2 | 0.598 |  |
| ap-northeast-1 | 0.487 |  |
| ap-northeast-2 | 0.594 |  |
| ap-northeast-3 | 0.512 |  |
| ap-south-1 | 0.918 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.753 |  |
| ap-southeast-2 | 0.627 |  |
| ap-southeast-3 | 0.792 |  |
| ap-southeast-4 | 0.664 |  |
| ap-southeast-5 | 0.761 |  |
| ap-southeast-6 | 0.718 |  |
| ap-southeast-7 | 0.857 |  |
| ca-central-1 | 0.267 | 16 |
| ca-west-1 | 0.219 |  |
| eu-central-1 | 0.559 |  |
| eu-central-2 | 0.583 |  |
| eu-north-1 | 0.607 |  |
| eu-south-1 | 0.585 |  |
| eu-south-2 | 0.579 |  |
| eu-west-1 | 0.476 |  |
| eu-west-2 | 0.518 |  |
| eu-west-3 | 0.517 |  |
| il-central-1 | 0.721 |  |
| me-central-1 | 0.938 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.665 |  |
| us-east-1 | 0.219 | 4659 |
| us-east-2 | 0.214 | 1599 |
| us-gov-east-1 | 0.208 | 1697 |
| us-gov-west-1 | 0.154 | 195 |
| us-west-1 | 0.089 | 3575 |
| us-west-2 | 0.148 | 158 |

