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
Updated: 2026-03-19T07:42:10.822569+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.996 |  |
| ap-east-1 | 0.721 |  |
| ap-east-2 | 0.657 |  |
| ap-northeast-1 | 0.536 |  |
| ap-northeast-2 | 0.651 |  |
| ap-northeast-3 | 0.563 |  |
| ap-south-1 | 0.934 |  |
| ap-south-2 | 0.964 |  |
| ap-southeast-1 | 0.790 |  |
| ap-southeast-2 | 0.712 |  |
| ap-southeast-3 | 0.852 |  |
| ap-southeast-4 | 0.754 |  |
| ap-southeast-5 | 0.814 |  |
| ap-southeast-6 | 0.758 |  |
| ap-southeast-7 | 0.899 |  |
| ca-central-1 | 0.198 | 16 |
| ca-west-1 | 0.226 |  |
| eu-central-1 | 0.496 |  |
| eu-central-2 | 0.519 |  |
| eu-north-1 | 0.540 |  |
| eu-south-1 | 0.516 |  |
| eu-south-2 | 0.542 |  |
| eu-west-1 | 0.420 |  |
| eu-west-2 | 0.452 |  |
| eu-west-3 | 0.475 |  |
| il-central-1 | 0.673 |  |
| me-central-1 | 0.860 |  |
| me-south-1 | 0.826 |  |
| mx-central-1 | 0.203 |  |
| sa-east-1 | 0.584 |  |
| us-east-1 | 0.136 | 4309 |
| us-east-2 | 0.131 | 1436 |
| us-gov-east-1 | 0.164 | 1586 |
| us-gov-west-1 | 0.221 | 189 |
| us-west-1 | 0.168 | 3254 |
| us-west-2 | 0.220 | 148 |

