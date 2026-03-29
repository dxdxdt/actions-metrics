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
Updated: 2026-03-29T15:24:41.274005+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.859 |  |
| ap-east-1 | 0.815 |  |
| ap-east-2 | 0.744 |  |
| ap-northeast-1 | 0.627 |  |
| ap-northeast-2 | 0.734 |  |
| ap-northeast-3 | 0.655 |  |
| ap-south-1 | 0.829 |  |
| ap-south-2 | 0.884 |  |
| ap-southeast-1 | 0.885 |  |
| ap-southeast-2 | 0.803 |  |
| ap-southeast-3 | 0.943 |  |
| ap-southeast-4 | 0.845 |  |
| ap-southeast-5 | 0.905 |  |
| ap-southeast-6 | 0.853 |  |
| ap-southeast-7 | 0.993 |  |
| ca-central-1 | 0.096 | 16 |
| ca-west-1 | 0.299 |  |
| eu-central-1 | 0.374 |  |
| eu-central-2 | 0.392 |  |
| eu-north-1 | 0.435 |  |
| eu-south-1 | 0.399 |  |
| eu-south-2 | 0.433 |  |
| eu-west-1 | 0.292 |  |
| eu-west-2 | 0.331 |  |
| eu-west-3 | 0.353 |  |
| il-central-1 | 0.552 |  |
| me-central-1 | 0.752 |  |
| me-south-1 | 0.736 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.488 |  |
| us-east-1 | 0.048 | 4392 |
| us-east-2 | 0.086 | 1464 |
| us-gov-east-1 | 0.091 | 1612 |
| us-gov-west-1 | 0.321 | 190 |
| us-west-1 | 0.258 | 3317 |
| us-west-2 | 0.323 | 152 |

