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
Updated: 2026-05-26T21:45:31.699879+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.967 |  |
| ap-east-1 | 0.734 |  |
| ap-east-2 | 0.681 |  |
| ap-northeast-1 | 0.554 |  |
| ap-northeast-2 | 0.664 |  |
| ap-northeast-3 | 0.580 |  |
| ap-south-1 | 0.855 |  |
| ap-south-2 | 0.873 |  |
| ap-southeast-1 | 0.798 |  |
| ap-southeast-2 | 0.700 |  |
| ap-southeast-3 | 0.859 |  |
| ap-southeast-4 | 0.740 |  |
| ap-southeast-5 | 0.829 |  |
| ap-southeast-6 | 0.739 |  |
| ap-southeast-7 | 0.905 |  |
| ca-central-1 | 0.211 | 16 |
| ca-west-1 | 0.253 |  |
| eu-central-1 | 0.480 |  |
| eu-central-2 | 0.498 |  |
| eu-north-1 | 0.522 |  |
| eu-south-1 | 0.507 |  |
| eu-south-2 | 0.514 |  |
| eu-west-1 | 0.396 |  |
| eu-west-2 | 0.434 |  |
| eu-west-3 | 0.457 |  |
| il-central-1 | 0.639 |  |
| me-central-1 | 0.872 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.251 |  |
| sa-east-1 | 0.590 |  |
| us-east-1 | 0.150 | 4689 |
| us-east-2 | 0.160 | 1611 |
| us-gov-east-1 | 0.161 | 1706 |
| us-gov-west-1 | 0.231 | 195 |
| us-west-1 | 0.176 | 3608 |
| us-west-2 | 0.231 | 160 |

