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
Updated: 2026-03-07T03:54:11.282749+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.919 |  |
| ap-east-1 | 0.760 |  |
| ap-east-2 | 0.699 |  |
| ap-northeast-1 | 0.581 |  |
| ap-northeast-2 | 0.690 |  |
| ap-northeast-3 | 0.607 |  |
| ap-south-1 | 0.881 |  |
| ap-south-2 | 0.936 |  |
| ap-southeast-1 | 0.838 |  |
| ap-southeast-2 | 0.742 |  |
| ap-southeast-3 | 0.896 |  |
| ap-southeast-4 | 0.782 |  |
| ap-southeast-5 | 0.859 |  |
| ap-southeast-6 | 0.793 |  |
| ap-southeast-7 | 0.938 |  |
| ca-central-1 | 0.130 | 16 |
| ca-west-1 | 0.257 |  |
| eu-central-1 | 0.426 |  |
| eu-central-2 | 0.446 |  |
| eu-north-1 | 0.481 |  |
| eu-south-1 | 0.455 |  |
| eu-south-2 | 0.466 |  |
| eu-west-1 | 0.349 |  |
| eu-west-2 | 0.386 |  |
| eu-west-3 | 0.409 |  |
| il-central-1 | 0.607 |  |
| me-central-1 | 0.816 |  |
| me-south-1 | 0.778 |  |
| mx-central-1 | 0.266 |  |
| sa-east-1 | 0.534 |  |
| us-east-1 | 0.095 | 4233 |
| us-east-2 | 0.105 | 1405 |
| us-gov-east-1 | 0.102 | 1534 |
| us-gov-west-1 | 0.255 | 174 |
| us-west-1 | 0.227 | 3187 |
| us-west-2 | 0.256 | 142 |

