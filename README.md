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
Updated: 2026-11-21T03:40:15.246755+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.727 |  |
| ap-east-1 | 0.514 |  |
| ap-east-2 | 0.467 |  |
| ap-northeast-1 | 0.379 |  |
| ap-northeast-2 | 0.454 |  |
| ap-northeast-3 | 0.397 |  |
| ap-south-1 | 0.684 |  |
| ap-south-2 | 0.693 |  |
| ap-southeast-1 | 0.580 |  |
| ap-southeast-2 | 0.501 |  |
| ap-southeast-3 | 0.635 |  |
| ap-southeast-4 | 0.559 |  |
| ap-southeast-5 | 0.596 |  |
| ap-southeast-6 | 0.526 |  |
| ap-southeast-7 | 0.653 |  |
| ca-central-1 | 0.159 | 18 |
| ca-west-1 | 0.198 |  |
| eu-central-1 | 0.380 |  |
| eu-central-2 | 0.401 |  |
| eu-north-1 | 0.424 |  |
| eu-south-1 | 0.401 |  |
| eu-south-2 | 0.385 |  |
| eu-west-1 | 0.321 |  |
| eu-west-2 | 0.348 |  |
| eu-west-3 | 0.365 |  |
| il-central-1 | 0.504 |  |
| me-central-1 | 0.651 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.686 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.461 |  |
| us-east-1 | 0.127 | 5192 |
| us-east-2 | 0.146 | 1730 |
| us-gov-east-1 | 0.133 | 1964 |
| us-gov-west-1 | 0.146 | 248 |
| us-west-1 | 0.104 | 4221 |
| us-west-2 | 0.146 | 199 |

