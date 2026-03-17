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
Updated: 2026-03-17T20:31:59.268719+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.996 |  |
| ap-east-1 | 0.690 |  |
| ap-east-2 | 0.627 |  |
| ap-northeast-1 | 0.508 |  |
| ap-northeast-2 | 0.614 |  |
| ap-northeast-3 | 0.533 |  |
| ap-south-1 | 0.898 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.768 |  |
| ap-southeast-2 | 0.673 |  |
| ap-southeast-3 | 0.827 |  |
| ap-southeast-4 | 0.710 |  |
| ap-southeast-5 | 0.789 |  |
| ap-southeast-6 | 0.711 |  |
| ap-southeast-7 | 0.875 |  |
| ca-central-1 | 0.231 | 16 |
| ca-west-1 | 0.239 |  |
| eu-central-1 | 0.511 |  |
| eu-central-2 | 0.533 |  |
| eu-north-1 | 0.586 |  |
| eu-south-1 | 0.529 |  |
| eu-south-2 | 0.538 |  |
| eu-west-1 | 0.450 |  |
| eu-west-2 | 0.470 |  |
| eu-west-3 | 0.480 |  |
| il-central-1 | 0.668 |  |
| me-central-1 | 0.919 |  |
| me-south-1 | 0.837 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.613 |  |
| us-east-1 | 0.171 | 4298 |
| us-east-2 | 0.173 | 1430 |
| us-gov-east-1 | 0.176 | 1584 |
| us-gov-west-1 | 0.191 | 187 |
| us-west-1 | 0.138 | 3248 |
| us-west-2 | 0.192 | 148 |

