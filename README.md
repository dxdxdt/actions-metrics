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
Updated: 2026-02-27T21:22:32.578697+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.998 |  |
| ap-east-1 | 0.703 |  |
| ap-east-2 | 0.645 |  |
| ap-northeast-1 | 0.524 |  |
| ap-northeast-2 | 0.625 |  |
| ap-northeast-3 | 0.548 |  |
| ap-south-1 | 0.919 |  |
| ap-south-2 | 0.924 |  |
| ap-southeast-1 | 0.776 |  |
| ap-southeast-2 | 0.685 |  |
| ap-southeast-3 | 0.836 |  |
| ap-southeast-4 | 0.723 |  |
| ap-southeast-5 | 0.797 |  |
| ap-southeast-6 | 0.770 |  |
| ap-southeast-7 | 0.884 |  |
| ca-central-1 | 0.188 | 16 |
| ca-west-1 | 0.207 |  |
| eu-central-1 | 0.509 |  |
| eu-central-2 | 0.516 |  |
| eu-north-1 | 0.554 |  |
| eu-south-1 | 0.531 |  |
| eu-south-2 | 0.535 |  |
| eu-west-1 | 0.430 |  |
| eu-west-2 | 0.463 |  |
| eu-west-3 | 0.481 |  |
| il-central-1 | 0.663 |  |
| me-central-1 | 0.869 |  |
| me-south-1 | 0.830 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.609 |  |
| us-east-1 | 0.152 | 4194 |
| us-east-2 | 0.134 | 1382 |
| us-gov-east-1 | 0.130 | 1517 |
| us-gov-west-1 | 0.197 | 162 |
| us-west-1 | 0.174 | 3137 |
| us-west-2 | 0.191 | 133 |

