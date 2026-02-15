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
Updated: 2026-02-15T17:19:58.901816+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.924 |  |
| ap-east-1 | 0.772 |  |
| ap-east-2 | 0.704 |  |
| ap-northeast-1 | 0.597 |  |
| ap-northeast-2 | 0.699 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.954 |  |
| ap-southeast-1 | 0.855 |  |
| ap-southeast-2 | 0.753 |  |
| ap-southeast-3 | 0.913 |  |
| ap-southeast-4 | 0.786 |  |
| ap-southeast-5 | 0.877 |  |
| ap-southeast-6 | 0.793 |  |
| ap-southeast-7 | 0.952 |  |
| ca-central-1 | 0.107 | 16 |
| ca-west-1 | 0.225 |  |
| eu-central-1 | 0.433 |  |
| eu-central-2 | 0.455 |  |
| eu-north-1 | 0.480 |  |
| eu-south-1 | 0.461 |  |
| eu-south-2 | 0.468 |  |
| eu-west-1 | 0.361 |  |
| eu-west-2 | 0.391 |  |
| eu-west-3 | 0.413 |  |
| il-central-1 | 0.597 |  |
| me-central-1 | 0.821 |  |
| me-south-1 | 0.773 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.538 |  |
| us-east-1 | 0.080 | 4125 |
| us-east-2 | 0.069 | 1345 |
| us-gov-east-1 | 0.073 | 1474 |
| us-gov-west-1 | 0.248 | 148 |
| us-west-1 | 0.252 | 3062 |
| us-west-2 | 0.254 | 125 |

