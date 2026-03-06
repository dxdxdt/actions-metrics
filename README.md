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
Updated: 2026-03-06T22:20:51.176155+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.026 |  |
| ap-east-1 | 0.691 |  |
| ap-east-2 | 0.629 |  |
| ap-northeast-1 | 0.510 |  |
| ap-northeast-2 | 0.603 |  |
| ap-northeast-3 | 0.536 |  |
| ap-south-1 | 0.930 |  |
| ap-south-2 | 0.954 |  |
| ap-southeast-1 | 0.762 |  |
| ap-southeast-2 | 0.665 |  |
| ap-southeast-3 | 0.817 |  |
| ap-southeast-4 | 0.706 |  |
| ap-southeast-5 | 0.785 |  |
| ap-southeast-6 | 0.708 |  |
| ap-southeast-7 | 0.861 |  |
| ca-central-1 | 0.194 | 16 |
| ca-west-1 | 0.209 |  |
| eu-central-1 | 0.533 |  |
| eu-central-2 | 0.546 |  |
| eu-north-1 | 0.577 |  |
| eu-south-1 | 0.556 |  |
| eu-south-2 | 0.567 |  |
| eu-west-1 | 0.458 |  |
| eu-west-2 | 0.483 |  |
| eu-west-3 | 0.510 |  |
| il-central-1 | 0.703 |  |
| me-central-1 | 0.908 |  |
| me-south-1 | 0.864 |  |
| mx-central-1 | 0.209 |  |
| sa-east-1 | 0.649 |  |
| us-east-1 | 0.170 | 4232 |
| us-east-2 | 0.146 | 1405 |
| us-gov-east-1 | 0.147 | 1533 |
| us-gov-west-1 | 0.169 | 173 |
| us-west-1 | 0.155 | 3187 |
| us-west-2 | 0.168 | 142 |

