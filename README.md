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
Updated: 2026-04-23T18:58:46.024799+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.905 |  |
| ap-east-1 | 0.792 |  |
| ap-east-2 | 0.716 |  |
| ap-northeast-1 | 0.601 |  |
| ap-northeast-2 | 0.723 |  |
| ap-northeast-3 | 0.625 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.932 |  |
| ap-southeast-1 | 0.861 |  |
| ap-southeast-2 | 0.778 |  |
| ap-southeast-3 | 0.912 |  |
| ap-southeast-4 | 0.826 |  |
| ap-southeast-5 | 0.873 |  |
| ap-southeast-6 | 0.849 |  |
| ap-southeast-7 | 0.959 |  |
| ca-central-1 | 0.102 | 16 |
| ca-west-1 | 0.259 |  |
| eu-central-1 | 0.416 |  |
| eu-central-2 | 0.446 |  |
| eu-north-1 | 0.485 |  |
| eu-south-1 | 0.448 |  |
| eu-south-2 | 0.456 |  |
| eu-west-1 | 0.341 |  |
| eu-west-2 | 0.377 |  |
| eu-west-3 | 0.398 |  |
| il-central-1 | 0.607 |  |
| me-central-1 | 0.768 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.525 |  |
| us-east-1 | 0.071 | 4549 |
| us-east-2 | 0.075 | 1527 |
| us-gov-east-1 | 0.079 | 1662 |
| us-gov-west-1 | 0.289 | 194 |
| us-west-1 | 0.232 | 3464 |
| us-west-2 | 0.286 | 157 |

