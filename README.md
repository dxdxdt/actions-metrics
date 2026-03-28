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
Updated: 2026-03-28T08:30:31.073440+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.877 |  |
| ap-east-1 | 0.799 |  |
| ap-east-2 | 0.745 |  |
| ap-northeast-1 | 0.633 |  |
| ap-northeast-2 | 0.734 |  |
| ap-northeast-3 | 0.657 |  |
| ap-south-1 | 0.833 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.882 |  |
| ap-southeast-2 | 0.806 |  |
| ap-southeast-3 | 0.941 |  |
| ap-southeast-4 | 0.841 |  |
| ap-southeast-5 | 0.901 |  |
| ap-southeast-6 | 0.848 |  |
| ap-southeast-7 | 0.979 |  |
| ca-central-1 | 0.100 | 16 |
| ca-west-1 | 0.280 |  |
| eu-central-1 | 0.388 |  |
| eu-central-2 | 0.406 |  |
| eu-north-1 | 0.445 |  |
| eu-south-1 | 0.406 |  |
| eu-south-2 | 0.447 |  |
| eu-west-1 | 0.303 |  |
| eu-west-2 | 0.339 |  |
| eu-west-3 | 0.368 |  |
| il-central-1 | 0.574 |  |
| me-central-1 | 0.760 |  |
| me-south-1 | 0.718 |  |
| mx-central-1 | 0.253 |  |
| sa-east-1 | 0.486 |  |
| us-east-1 | 0.056 | 4376 |
| us-east-2 | 0.090 | 1459 |
| us-gov-east-1 | 0.093 | 1610 |
| us-gov-west-1 | 0.333 | 190 |
| us-west-1 | 0.263 | 3313 |
| us-west-2 | 0.304 | 152 |

