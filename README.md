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
Updated: 2026-08-07T02:13:11.733786+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.861 |  |
| ap-east-1 | 0.815 |  |
| ap-east-2 | 0.750 |  |
| ap-northeast-1 | 0.633 |  |
| ap-northeast-2 | 0.748 |  |
| ap-northeast-3 | 0.659 |  |
| ap-south-1 | 0.819 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.888 |  |
| ap-southeast-2 | 0.806 |  |
| ap-southeast-3 | 0.940 |  |
| ap-southeast-4 | 0.840 |  |
| ap-southeast-5 | 0.913 |  |
| ap-southeast-6 | 0.858 |  |
| ap-southeast-7 | 0.996 |  |
| ca-central-1 | 0.108 | 18 |
| ca-west-1 | 0.261 |  |
| eu-central-1 | 0.377 |  |
| eu-central-2 | 0.403 |  |
| eu-north-1 | 0.427 |  |
| eu-south-1 | 0.399 |  |
| eu-south-2 | 0.413 |  |
| eu-west-1 | 0.299 |  |
| eu-west-2 | 0.337 |  |
| eu-west-3 | 0.358 |  |
| il-central-1 | 0.536 |  |
| me-central-1 | 0.780 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.485 |  |
| us-east-1 | 0.056 | 4949 |
| us-east-2 | 0.084 | 1674 |
| us-gov-east-1 | 0.096 | 1805 |
| us-gov-west-1 | 0.322 | 211 |
| us-west-1 | 0.280 | 3889 |
| us-west-2 | 0.317 | 172 |

