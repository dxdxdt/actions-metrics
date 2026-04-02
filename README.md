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
Updated: 2026-04-02T06:08:11.617033+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.018 |  |
| ap-east-1 | 0.690 |  |
| ap-east-2 | 0.630 |  |
| ap-northeast-1 | 0.506 |  |
| ap-northeast-2 | 0.626 |  |
| ap-northeast-3 | 0.533 |  |
| ap-south-1 | 0.908 |  |
| ap-south-2 | 0.908 |  |
| ap-southeast-1 | 0.765 |  |
| ap-southeast-2 | 0.652 |  |
| ap-southeast-3 | 0.837 |  |
| ap-southeast-4 | 0.692 |  |
| ap-southeast-5 | 0.783 |  |
| ap-southeast-6 | 0.705 |  |
| ap-southeast-7 | 0.861 |  |
| ca-central-1 | 0.222 | 16 |
| ca-west-1 | 0.251 |  |
| eu-central-1 | 0.548 |  |
| eu-central-2 | 0.559 |  |
| eu-north-1 | 0.595 |  |
| eu-south-1 | 0.566 |  |
| eu-south-2 | 0.573 |  |
| eu-west-1 | 0.460 |  |
| eu-west-2 | 0.511 |  |
| eu-west-3 | 0.518 |  |
| il-central-1 | 0.704 |  |
| me-central-1 | 0.911 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.710 |  |
| us-east-1 | 0.185 | 4418 |
| us-east-2 | 0.165 | 1472 |
| us-gov-east-1 | 0.161 | 1620 |
| us-gov-west-1 | 0.176 | 190 |
| us-west-1 | 0.123 | 3334 |
| us-west-2 | 0.172 | 153 |

