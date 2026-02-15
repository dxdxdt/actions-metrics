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
Updated: 2026-02-15T12:32:51.806868+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.943 |  |
| ap-east-1 | 0.762 |  |
| ap-east-2 | 0.692 |  |
| ap-northeast-1 | 0.572 |  |
| ap-northeast-2 | 0.681 |  |
| ap-south-1 | 0.904 |  |
| ap-south-2 | 0.967 |  |
| ap-southeast-1 | 0.836 |  |
| ap-southeast-2 | 0.738 |  |
| ap-southeast-3 | 0.876 |  |
| ap-southeast-4 | 0.783 |  |
| ap-southeast-5 | 0.849 |  |
| ap-southeast-6 | 0.815 |  |
| ap-southeast-7 | 0.951 |  |
| ca-central-1 | 0.112 | 16 |
| ca-west-1 | 0.216 |  |
| eu-central-1 | 0.448 |  |
| eu-central-2 | 0.472 |  |
| eu-north-1 | 0.499 |  |
| eu-south-1 | 0.471 |  |
| eu-south-2 | 0.488 |  |
| eu-west-1 | 0.376 |  |
| eu-west-2 | 0.406 |  |
| eu-west-3 | 0.434 |  |
| il-central-1 | 0.621 |  |
| me-central-1 | 0.835 |  |
| me-south-1 | 0.786 |  |
| mx-central-1 | 0.220 |  |
| sa-east-1 | 0.559 |  |
| us-east-1 | 0.096 | 4124 |
| us-east-2 | 0.071 | 1343 |
| us-gov-east-1 | 0.074 | 1472 |
| us-gov-west-1 | 0.225 | 148 |
| us-west-1 | 0.242 | 3062 |
| us-west-2 | 0.228 | 125 |

