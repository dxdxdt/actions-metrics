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
Updated: 2026-04-07T06:15:43.558545+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.969 |  |
| ap-east-1 | 0.734 |  |
| ap-east-2 | 0.678 |  |
| ap-northeast-1 | 0.653 |  |
| ap-northeast-2 | 0.647 |  |
| ap-northeast-3 | 0.581 |  |
| ap-south-1 | 0.898 |  |
| ap-south-2 | 0.917 |  |
| ap-southeast-1 | 0.816 |  |
| ap-southeast-2 | 0.719 |  |
| ap-southeast-3 | 0.866 |  |
| ap-southeast-4 | 0.757 |  |
| ap-southeast-5 | 0.829 |  |
| ap-southeast-6 | 0.750 |  |
| ap-southeast-7 | 0.916 |  |
| ca-central-1 | 0.166 | 16 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.483 |  |
| eu-central-2 | 0.493 |  |
| eu-north-1 | 0.525 |  |
| eu-south-1 | 0.496 |  |
| eu-south-2 | 0.515 |  |
| eu-west-1 | 0.404 |  |
| eu-west-2 | 0.441 |  |
| eu-west-3 | 0.458 |  |
| il-central-1 | 0.635 |  |
| me-central-1 | 0.849 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.210 |  |
| sa-east-1 | 0.580 |  |
| us-east-1 | 0.132 | 4452 |
| us-east-2 | 0.131 | 1487 |
| us-gov-east-1 | 0.132 | 1632 |
| us-gov-west-1 | 0.238 | 191 |
| us-west-1 | 0.184 | 3367 |
| us-west-2 | 0.238 | 154 |

