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
Updated: 2026-08-05T15:56:10.002537+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.889 |  |
| ap-east-1 | 0.795 |  |
| ap-east-2 | 0.734 |  |
| ap-northeast-1 | 0.617 |  |
| ap-northeast-2 | 0.721 |  |
| ap-northeast-3 | 0.643 |  |
| ap-south-1 | 0.836 |  |
| ap-south-2 | 0.923 |  |
| ap-southeast-1 | 0.869 |  |
| ap-southeast-2 | 0.774 |  |
| ap-southeast-3 | 0.923 |  |
| ap-southeast-4 | 0.814 |  |
| ap-southeast-5 | 0.887 |  |
| ap-southeast-6 | 0.812 |  |
| ap-southeast-7 | 0.970 |  |
| ca-central-1 | 0.123 | 17 |
| ca-west-1 | 0.252 |  |
| eu-central-1 | 0.406 |  |
| eu-central-2 | 0.423 |  |
| eu-north-1 | 0.452 |  |
| eu-south-1 | 0.420 |  |
| eu-south-2 | 0.435 |  |
| eu-west-1 | 0.322 |  |
| eu-west-2 | 0.359 |  |
| eu-west-3 | 0.389 |  |
| il-central-1 | 0.580 |  |
| me-central-1 | 0.793 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.509 |  |
| us-east-1 | 0.069 | 4943 |
| us-east-2 | 0.092 | 1674 |
| us-gov-east-1 | 0.103 | 1802 |
| us-gov-west-1 | 0.300 | 211 |
| us-west-1 | 0.240 | 3886 |
| us-west-2 | 0.298 | 172 |

