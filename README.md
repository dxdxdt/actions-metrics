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
Updated: 2026-02-15T22:17:36.517623+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.916 |  |
| ap-east-1 | 0.762 |  |
| ap-east-2 | 0.692 |  |
| ap-northeast-1 | 0.574 |  |
| ap-northeast-2 | 0.686 |  |
| ap-south-1 | 0.860 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.837 |  |
| ap-southeast-2 | 0.735 |  |
| ap-southeast-3 | 0.895 |  |
| ap-southeast-4 | 0.777 |  |
| ap-southeast-5 | 0.860 |  |
| ap-southeast-6 | 0.816 |  |
| ap-southeast-7 | 0.941 |  |
| ca-central-1 | 0.154 | 16 |
| ca-west-1 | 0.268 |  |
| eu-central-1 | 0.433 |  |
| eu-central-2 | 0.445 |  |
| eu-north-1 | 0.486 |  |
| eu-south-1 | 0.469 |  |
| eu-south-2 | 0.469 |  |
| eu-west-1 | 0.351 |  |
| eu-west-2 | 0.397 |  |
| eu-west-3 | 0.408 |  |
| il-central-1 | 0.599 |  |
| me-central-1 | 0.814 |  |
| me-south-1 | 0.777 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.530 |  |
| us-east-1 | 0.099 | 4127 |
| us-east-2 | 0.125 | 1346 |
| us-gov-east-1 | 0.125 | 1475 |
| us-gov-west-1 | 0.263 | 148 |
| us-west-1 | 0.223 | 3063 |
| us-west-2 | 0.266 | 125 |

