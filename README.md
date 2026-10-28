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
Updated: 2026-10-28T03:17:38.198831+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.708 |  |
| ap-east-1 | 0.562 |  |
| ap-east-2 | 0.507 |  |
| ap-northeast-1 | 0.421 |  |
| ap-northeast-2 | 0.499 |  |
| ap-northeast-3 | 0.439 |  |
| ap-south-1 | 0.685 |  |
| ap-south-2 | 0.745 |  |
| ap-southeast-1 | 0.615 |  |
| ap-southeast-2 | 0.539 |  |
| ap-southeast-3 | 0.656 |  |
| ap-southeast-4 | 0.597 |  |
| ap-southeast-5 | 0.626 |  |
| ap-southeast-6 | 0.587 |  |
| ap-southeast-7 | 0.695 |  |
| ca-central-1 | 0.128 | 18 |
| ca-west-1 | 0.185 |  |
| eu-central-1 | 0.351 |  |
| eu-central-2 | 0.369 |  |
| eu-north-1 | 0.398 |  |
| eu-south-1 | 0.368 |  |
| eu-south-2 | 0.352 |  |
| eu-west-1 | 0.291 |  |
| eu-west-2 | 0.326 |  |
| eu-west-3 | 0.332 |  |
| il-central-1 | 0.473 |  |
| me-central-1 | 0.824 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.142 |  |
| sa-east-1 | 0.441 |  |
| us-east-1 | 0.091 | 5164 |
| us-east-2 | 0.107 | 1713 |
| us-gov-east-1 | 0.105 | 1955 |
| us-gov-west-1 | 0.183 | 240 |
| us-west-1 | 0.138 | 4197 |
| us-west-2 | 0.184 | 195 |

