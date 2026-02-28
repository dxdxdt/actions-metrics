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
Updated: 2026-02-28T06:28:42.977591+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.926 |  |
| ap-east-1 | 0.756 |  |
| ap-east-2 | 0.682 |  |
| ap-northeast-1 | 0.578 |  |
| ap-northeast-2 | 0.677 |  |
| ap-northeast-3 | 0.592 |  |
| ap-south-1 | 0.893 |  |
| ap-south-2 | 0.924 |  |
| ap-southeast-1 | 0.833 |  |
| ap-southeast-2 | 0.728 |  |
| ap-southeast-3 | 0.887 |  |
| ap-southeast-4 | 0.769 |  |
| ap-southeast-5 | 0.849 |  |
| ap-southeast-6 | 0.779 |  |
| ap-southeast-7 | 0.941 |  |
| ca-central-1 | 0.152 | 16 |
| ca-west-1 | 0.269 |  |
| eu-central-1 | 0.436 |  |
| eu-central-2 | 0.456 |  |
| eu-north-1 | 0.493 |  |
| eu-south-1 | 0.463 |  |
| eu-south-2 | 0.471 |  |
| eu-west-1 | 0.353 |  |
| eu-west-2 | 0.393 |  |
| eu-west-3 | 0.414 |  |
| il-central-1 | 0.623 |  |
| me-central-1 | 0.831 |  |
| me-south-1 | 0.795 |  |
| mx-central-1 | 0.223 |  |
| sa-east-1 | 0.544 |  |
| us-east-1 | 0.107 | 4197 |
| us-east-2 | 0.130 | 1382 |
| us-gov-east-1 | 0.123 | 1518 |
| us-gov-west-1 | 0.243 | 164 |
| us-west-1 | 0.218 | 3138 |
| us-west-2 | 0.242 | 133 |

