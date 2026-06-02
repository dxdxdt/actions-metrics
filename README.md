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
Updated: 2026-06-02T10:08:20.139548+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.938 |  |
| ap-east-1 | 0.785 |  |
| ap-east-2 | 0.709 |  |
| ap-northeast-1 | 0.585 |  |
| ap-northeast-2 | 0.689 |  |
| ap-northeast-3 | 0.610 |  |
| ap-south-1 | 0.874 |  |
| ap-south-2 | 0.971 |  |
| ap-southeast-1 | 0.837 |  |
| ap-southeast-2 | 0.738 |  |
| ap-southeast-3 | 0.888 |  |
| ap-southeast-4 | 0.784 |  |
| ap-southeast-5 | 0.851 |  |
| ap-southeast-6 | 0.784 |  |
| ap-southeast-7 | 0.939 |  |
| ca-central-1 | 0.162 | 16 |
| ca-west-1 | 0.255 |  |
| eu-central-1 | 0.460 |  |
| eu-central-2 | 0.473 |  |
| eu-north-1 | 0.492 |  |
| eu-south-1 | 0.485 |  |
| eu-south-2 | 0.486 |  |
| eu-west-1 | 0.381 |  |
| eu-west-2 | 0.412 |  |
| eu-west-3 | 0.433 |  |
| il-central-1 | 0.603 |  |
| me-central-1 | 0.942 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.208 |  |
| sa-east-1 | 0.564 |  |
| us-east-1 | 0.098 | 4712 |
| us-east-2 | 0.089 | 1620 |
| us-gov-east-1 | 0.099 | 1708 |
| us-gov-west-1 | 0.256 | 196 |
| us-west-1 | 0.201 | 3629 |
| us-west-2 | 0.261 | 161 |

