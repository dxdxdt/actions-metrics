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
Updated: 2026-08-23T05:21:51.540629+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.062 |  |
| ap-east-1 | 0.637 |  |
| ap-east-2 | 0.577 |  |
| ap-northeast-1 | 0.458 |  |
| ap-northeast-2 | 0.561 |  |
| ap-northeast-3 | 0.485 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.883 |  |
| ap-southeast-1 | 0.710 |  |
| ap-southeast-2 | 0.594 |  |
| ap-southeast-3 | 0.767 |  |
| ap-southeast-4 | 0.636 |  |
| ap-southeast-5 | 0.731 |  |
| ap-southeast-6 | 0.630 |  |
| ap-southeast-7 | 0.818 |  |
| ca-central-1 | 0.304 | 18 |
| ca-west-1 | 0.179 |  |
| eu-central-1 | 0.576 |  |
| eu-central-2 | 0.605 |  |
| eu-north-1 | 0.621 |  |
| eu-south-1 | 0.614 |  |
| eu-south-2 | 0.608 |  |
| eu-west-1 | 0.497 |  |
| eu-west-2 | 0.541 |  |
| eu-west-3 | 0.552 |  |
| il-central-1 | 0.740 |  |
| me-central-1 | 0.940 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.699 |  |
| us-east-1 | 0.244 | 5048 |
| us-east-2 | 0.271 | 1681 |
| us-gov-east-1 | 0.235 | 1870 |
| us-gov-west-1 | 0.119 | 225 |
| us-west-1 | 0.064 | 4032 |
| us-west-2 | 0.121 | 184 |

