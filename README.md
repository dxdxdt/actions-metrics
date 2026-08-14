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
Updated: 2026-08-14T05:37:49.561300+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.964 |  |
| ap-east-1 | 0.714 |  |
| ap-east-2 | 0.653 |  |
| ap-northeast-1 | 0.532 |  |
| ap-northeast-2 | 0.641 |  |
| ap-northeast-3 | 0.560 |  |
| ap-south-1 | 0.890 |  |
| ap-south-2 | 0.933 |  |
| ap-southeast-1 | 0.796 |  |
| ap-southeast-2 | 0.689 |  |
| ap-southeast-3 | 0.840 |  |
| ap-southeast-4 | 0.732 |  |
| ap-southeast-5 | 0.806 |  |
| ap-southeast-6 | 0.726 |  |
| ap-southeast-7 | 0.887 |  |
| ca-central-1 | 0.182 | 18 |
| ca-west-1 | 0.215 |  |
| eu-central-1 | 0.486 |  |
| eu-central-2 | 0.510 |  |
| eu-north-1 | 0.552 |  |
| eu-south-1 | 0.508 |  |
| eu-south-2 | 0.533 |  |
| eu-west-1 | 0.411 |  |
| eu-west-2 | 0.455 |  |
| eu-west-3 | 0.483 |  |
| il-central-1 | 0.650 |  |
| me-central-1 | 0.888 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.209 |  |
| sa-east-1 | 0.618 |  |
| us-east-1 | 0.154 | 4991 |
| us-east-2 | 0.166 | 1679 |
| us-gov-east-1 | 0.129 | 1826 |
| us-gov-west-1 | 0.202 | 222 |
| us-west-1 | 0.150 | 3943 |
| us-west-2 | 0.201 | 176 |

