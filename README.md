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
Updated: 2026-05-30T13:08:06.713784+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.060 |  |
| ap-east-1 | 0.636 |  |
| ap-east-2 | 0.572 |  |
| ap-northeast-1 | 0.460 |  |
| ap-northeast-2 | 0.565 |  |
| ap-northeast-3 | 0.485 |  |
| ap-south-1 | 0.921 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.710 |  |
| ap-southeast-2 | 0.593 |  |
| ap-southeast-3 | 0.766 |  |
| ap-southeast-4 | 0.632 |  |
| ap-southeast-5 | 0.728 |  |
| ap-southeast-6 | 0.646 |  |
| ap-southeast-7 | 0.812 |  |
| ca-central-1 | 0.294 | 16 |
| ca-west-1 | 0.252 |  |
| eu-central-1 | 0.587 |  |
| eu-central-2 | 0.595 |  |
| eu-north-1 | 0.610 |  |
| eu-south-1 | 0.613 |  |
| eu-south-2 | 0.622 |  |
| eu-west-1 | 0.510 |  |
| eu-west-2 | 0.556 |  |
| eu-west-3 | 0.551 |  |
| il-central-1 | 0.730 |  |
| me-central-1 | 1.021 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.705 |  |
| us-east-1 | 0.255 | 4699 |
| us-east-2 | 0.240 | 1614 |
| us-gov-east-1 | 0.221 | 1708 |
| us-gov-west-1 | 0.115 | 195 |
| us-west-1 | 0.060 | 3621 |
| us-west-2 | 0.116 | 161 |

