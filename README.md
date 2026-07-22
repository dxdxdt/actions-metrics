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
Updated: 2026-07-22T01:53:20.375184+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.978 |  |
| ap-east-1 | 0.712 |  |
| ap-east-2 | 0.653 |  |
| ap-northeast-1 | 0.534 |  |
| ap-northeast-2 | 0.639 |  |
| ap-northeast-3 | 0.562 |  |
| ap-south-1 | 0.913 |  |
| ap-south-2 | 0.946 |  |
| ap-southeast-1 | 0.789 |  |
| ap-southeast-2 | 0.695 |  |
| ap-southeast-3 | 0.846 |  |
| ap-southeast-4 | 0.737 |  |
| ap-southeast-5 | 0.805 |  |
| ap-southeast-6 | 0.725 |  |
| ap-southeast-7 | 0.893 |  |
| ca-central-1 | 0.181 | 16 |
| ca-west-1 | 0.236 |  |
| eu-central-1 | 0.497 |  |
| eu-central-2 | 0.510 |  |
| eu-north-1 | 0.546 |  |
| eu-south-1 | 0.514 |  |
| eu-south-2 | 0.524 |  |
| eu-west-1 | 0.415 |  |
| eu-west-2 | 0.454 |  |
| eu-west-3 | 0.466 |  |
| il-central-1 | 0.640 |  |
| me-central-1 | 0.866 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.182 |  |
| sa-east-1 | 0.597 |  |
| us-east-1 | 0.138 | 4896 |
| us-east-2 | 0.151 | 1659 |
| us-gov-east-1 | 0.140 | 1773 |
| us-gov-west-1 | 0.217 | 206 |
| us-west-1 | 0.161 | 3816 |
| us-west-2 | 0.217 | 167 |

