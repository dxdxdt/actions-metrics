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
Updated: 2026-02-17T19:42:27.161986+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.908 |  |
| ap-east-1 | 0.790 |  |
| ap-east-2 | 0.737 |  |
| ap-northeast-1 | 0.615 |  |
| ap-northeast-2 | 0.720 |  |
| ap-northeast-3 | 0.635 |  |
| ap-south-1 | 0.838 |  |
| ap-south-2 | 0.928 |  |
| ap-southeast-1 | 0.879 |  |
| ap-southeast-2 | 0.798 |  |
| ap-southeast-3 | 0.921 |  |
| ap-southeast-4 | 0.840 |  |
| ap-southeast-5 | 0.901 |  |
| ap-southeast-6 | 0.883 |  |
| ap-southeast-7 | 0.974 |  |
| ca-central-1 | 0.103 | 16 |
| ca-west-1 | 0.253 |  |
| eu-central-1 | 0.407 |  |
| eu-central-2 | 0.420 |  |
| eu-north-1 | 0.455 |  |
| eu-south-1 | 0.431 |  |
| eu-south-2 | 0.441 |  |
| eu-west-1 | 0.329 |  |
| eu-west-2 | 0.360 |  |
| eu-west-3 | 0.388 |  |
| il-central-1 | 0.590 |  |
| me-central-1 | 0.779 |  |
| me-south-1 | 0.744 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.501 |  |
| us-east-1 | 0.066 | 4136 |
| us-east-2 | 0.084 | 1353 |
| us-gov-east-1 | 0.083 | 1485 |
| us-gov-west-1 | 0.281 | 153 |
| us-west-1 | 0.259 | 3068 |
| us-west-2 | 0.286 | 126 |

