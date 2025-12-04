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
Updated: 2025-12-04T14:15:17.093067+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.990 |  |
| ap-east-1 | 0.727 |  |
| ap-northeast-1 | 0.528 |  |
| ap-northeast-2 | 0.643 |  |
| ap-south-1 | 0.902 |  |
| ap-southeast-1 | 0.788 |  |
| ap-southeast-2 | 0.692 |  |
| ca-central-1 | 0.178 | 15 |
| eu-central-1 | 0.500 |  |
| eu-north-1 | 0.545 |  |
| eu-south-1 | 0.520 |  |
| eu-west-1 | 0.429 |  |
| eu-west-2 | 0.464 |  |
| eu-west-3 | 0.485 |  |
| me-south-1 | 0.827 |  |
| sa-east-1 | 0.608 |  |
| us-east-1 | 0.144 | 3628 |
| us-east-2 | 0.141 | 1125 |
| us-gov-east-1 | 0.121 | 1228 |
| us-gov-west-1 | 0.190 | 83 |
| us-west-1 | 0.183 | 2583 |
| us-west-2 | 0.190 | 56 |

