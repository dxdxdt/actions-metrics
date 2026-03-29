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
Updated: 2026-03-29T19:27:19.915224+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.885 |  |
| ap-east-1 | 0.801 |  |
| ap-east-2 | 0.735 |  |
| ap-northeast-1 | 0.619 |  |
| ap-northeast-2 | 0.726 |  |
| ap-northeast-3 | 0.641 |  |
| ap-south-1 | 0.843 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.873 |  |
| ap-southeast-2 | 0.800 |  |
| ap-southeast-3 | 0.927 |  |
| ap-southeast-4 | 0.849 |  |
| ap-southeast-5 | 0.897 |  |
| ap-southeast-6 | 0.876 |  |
| ap-southeast-7 | 0.978 |  |
| ca-central-1 | 0.114 | 16 |
| ca-west-1 | 0.338 |  |
| eu-central-1 | 0.391 |  |
| eu-central-2 | 0.411 |  |
| eu-north-1 | 0.451 |  |
| eu-south-1 | 0.408 |  |
| eu-south-2 | 0.453 |  |
| eu-west-1 | 0.315 |  |
| eu-west-2 | 0.344 |  |
| eu-west-3 | 0.372 |  |
| il-central-1 | 0.567 |  |
| me-central-1 | 0.769 |  |
| me-south-1 | 0.742 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.491 |  |
| us-east-1 | 0.056 | 4394 |
| us-east-2 | 0.086 | 1465 |
| us-gov-east-1 | 0.086 | 1613 |
| us-gov-west-1 | 0.321 | 190 |
| us-west-1 | 0.245 | 3317 |
| us-west-2 | 0.301 | 152 |

