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
Updated: 2026-10-14T19:53:16.568523+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.916 |  |
| ap-east-1 | 0.775 |  |
| ap-east-2 | 0.716 |  |
| ap-northeast-1 | 0.586 |  |
| ap-northeast-2 | 0.693 |  |
| ap-northeast-3 | 0.625 |  |
| ap-south-1 | 0.860 |  |
| ap-south-2 | 0.952 |  |
| ap-southeast-1 | 0.855 |  |
| ap-southeast-2 | 0.742 |  |
| ap-southeast-3 | 0.901 |  |
| ap-southeast-4 | 0.788 |  |
| ap-southeast-5 | 0.863 |  |
| ap-southeast-6 | 0.811 |  |
| ap-southeast-7 | 0.945 |  |
| ca-central-1 | 0.119 | 18 |
| ca-west-1 | 0.293 |  |
| eu-central-1 | 0.430 |  |
| eu-central-2 | 0.448 |  |
| eu-north-1 | 0.476 |  |
| eu-south-1 | 0.452 |  |
| eu-south-2 | 0.429 |  |
| eu-west-1 | 0.351 |  |
| eu-west-2 | 0.388 |  |
| eu-west-3 | 0.409 |  |
| il-central-1 | 0.592 |  |
| me-central-1 | 0.803 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.210 |  |
| sa-east-1 | 0.524 |  |
| us-east-1 | 0.082 | 5147 |
| us-east-2 | 0.083 | 1699 |
| us-gov-east-1 | 0.098 | 1940 |
| us-gov-west-1 | 0.270 | 237 |
| us-west-1 | 0.208 | 4169 |
| us-west-2 | 0.272 | 194 |

