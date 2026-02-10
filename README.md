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
Updated: 2026-02-10T14:18:59.924190+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.919 |  |
| ap-east-1 | 0.779 |  |
| ap-northeast-1 | 0.587 |  |
| ap-northeast-2 | 0.708 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.952 |  |
| ap-southeast-1 | 0.857 |  |
| ap-southeast-2 | 0.748 |  |
| ap-southeast-3 | 0.914 |  |
| ap-southeast-4 | 0.780 |  |
| ca-central-1 | 0.141 | 16 |
| ca-west-1 | 0.247 |  |
| eu-central-1 | 0.430 |  |
| eu-central-2 | 0.447 |  |
| eu-north-1 | 0.478 |  |
| eu-south-1 | 0.467 |  |
| eu-south-2 | 0.465 |  |
| eu-west-1 | 0.352 |  |
| eu-west-2 | 0.387 |  |
| eu-west-3 | 0.412 |  |
| il-central-1 | 0.600 |  |
| me-central-1 | 0.825 |  |
| me-south-1 | 0.789 |  |
| sa-east-1 | 0.528 |  |
| us-east-1 | 0.096 | 4097 |
| us-east-2 | 0.110 | 1329 |
| us-gov-east-1 | 0.111 | 1449 |
| us-gov-west-1 | 0.256 | 142 |
| us-west-1 | 0.223 | 3034 |
| us-west-2 | 0.263 | 125 |

