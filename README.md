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
Updated: 2026-10-06T08:22:48.019858+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.011 |  |
| ap-east-1 | 0.671 |  |
| ap-east-2 | 0.617 |  |
| ap-northeast-1 | 0.501 |  |
| ap-northeast-2 | 0.618 |  |
| ap-northeast-3 | 0.534 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.926 |  |
| ap-southeast-1 | 0.775 |  |
| ap-southeast-2 | 0.635 |  |
| ap-southeast-3 | 0.811 |  |
| ap-southeast-4 | 0.678 |  |
| ap-southeast-5 | 0.791 |  |
| ap-southeast-6 | 0.715 |  |
| ap-southeast-7 | 0.858 |  |
| ca-central-1 | 0.226 | 18 |
| ca-west-1 | 0.206 |  |
| eu-central-1 | 0.535 |  |
| eu-central-2 | 0.546 |  |
| eu-north-1 | 0.567 |  |
| eu-south-1 | 0.557 |  |
| eu-south-2 | 0.541 |  |
| eu-west-1 | 0.450 |  |
| eu-west-2 | 0.487 |  |
| eu-west-3 | 0.512 |  |
| il-central-1 | 0.684 |  |
| me-central-1 | 0.911 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.223 |  |
| sa-east-1 | 0.647 |  |
| us-east-1 | 0.198 | 5138 |
| us-east-2 | 0.200 | 1690 |
| us-gov-east-1 | 0.171 | 1934 |
| us-gov-west-1 | 0.159 | 237 |
| us-west-1 | 0.103 | 4158 |
| us-west-2 | 0.161 | 193 |

