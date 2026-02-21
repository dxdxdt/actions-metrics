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
Updated: 2026-02-21T14:20:03.664023+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.008 |  |
| ap-east-1 | 0.694 |  |
| ap-east-2 | 0.637 |  |
| ap-northeast-1 | 0.516 |  |
| ap-northeast-2 | 0.621 |  |
| ap-northeast-3 | 0.543 |  |
| ap-south-1 | 0.918 |  |
| ap-south-2 | 0.953 |  |
| ap-southeast-1 | 0.770 |  |
| ap-southeast-2 | 0.670 |  |
| ap-southeast-3 | 0.822 |  |
| ap-southeast-4 | 0.715 |  |
| ap-southeast-5 | 0.789 |  |
| ap-southeast-6 | 0.737 |  |
| ap-southeast-7 | 0.872 |  |
| ca-central-1 | 0.188 | 16 |
| ca-west-1 | 0.187 |  |
| eu-central-1 | 0.514 |  |
| eu-central-2 | 0.534 |  |
| eu-north-1 | 0.565 |  |
| eu-south-1 | 0.544 |  |
| eu-south-2 | 0.552 |  |
| eu-west-1 | 0.442 |  |
| eu-west-2 | 0.471 |  |
| eu-west-3 | 0.502 |  |
| il-central-1 | 0.714 |  |
| me-central-1 | 0.894 |  |
| me-south-1 | 0.857 |  |
| mx-central-1 | 0.204 |  |
| sa-east-1 | 0.629 |  |
| us-east-1 | 0.158 | 4157 |
| us-east-2 | 0.128 | 1362 |
| us-gov-east-1 | 0.129 | 1498 |
| us-gov-west-1 | 0.169 | 160 |
| us-west-1 | 0.168 | 3092 |
| us-west-2 | 0.169 | 129 |

