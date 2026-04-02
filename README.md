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
Updated: 2026-04-02T19:44:08.630061+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.971 |  |
| ap-east-1 | 0.726 |  |
| ap-east-2 | 0.666 |  |
| ap-northeast-1 | 0.548 |  |
| ap-northeast-2 | 0.648 |  |
| ap-northeast-3 | 0.570 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.926 |  |
| ap-southeast-1 | 0.801 |  |
| ap-southeast-2 | 0.715 |  |
| ap-southeast-3 | 0.854 |  |
| ap-southeast-4 | 0.752 |  |
| ap-southeast-5 | 0.828 |  |
| ap-southeast-6 | 0.779 |  |
| ap-southeast-7 | 0.901 |  |
| ca-central-1 | 0.189 | 16 |
| ca-west-1 | 0.273 |  |
| eu-central-1 | 0.473 |  |
| eu-central-2 | 0.505 |  |
| eu-north-1 | 0.537 |  |
| eu-south-1 | 0.510 |  |
| eu-south-2 | 0.519 |  |
| eu-west-1 | 0.394 |  |
| eu-west-2 | 0.434 |  |
| eu-west-3 | 0.460 |  |
| il-central-1 | 0.664 |  |
| me-central-1 | 0.852 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.591 |  |
| us-east-1 | 0.137 | 4421 |
| us-east-2 | 0.150 | 1474 |
| us-gov-east-1 | 0.138 | 1621 |
| us-gov-west-1 | 0.228 | 191 |
| us-west-1 | 0.174 | 3338 |
| us-west-2 | 0.224 | 153 |

